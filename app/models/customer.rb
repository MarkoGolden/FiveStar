# == Schema Information
#
# Table name: customers
#
#  id                  :integer          not null, primary key
#  first_name          :string(255)
#  last_name           :string(255)
#  mobile              :string(255)
#  address             :text
#  gps_location        :string(255)
#  id_pp               :string(255)
#  sex                 :integer
#  disabled            :boolean
#  race                :integer
#  number_in_household :integer
#  terms_agreed        :boolean
#  start_date          :date
#  end_date            :date
#  end_date_reason     :text
#  power_pack_paid     :boolean
#  lease_stove         :boolean
#  stove_number        :string(255)
#  installed           :boolean
#  fuel_cook           :hstore
#  fuel_heat           :hstore
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer
#  photo_file_name     :string(255)
#  photo_content_type  :string(255)
#  photo_file_size     :integer
#  photo_updated_at    :datetime
#

class Customer < ActiveRecord::Base
  # before_save :save_current_user_to_customer
  #   def save_current_user_to_customer
  #     self.user_id ||= session[:user_id]
  #   end
  store_accessor :fuel_cook, :cook_kerosene, :cook_coal, :cook_wood, :cook_charcoal, :cook_lpg, :cook_cng, :cook_electricity
  store_accessor :fuel_heat, :heat_kerosene, :heat_coal, :heat_wood, :heat_charcoal, :heat_lpg, :heat_cng, :heat_electricity

  GENDER_VALUES = [
    ['Male', 'male'],
    ['Female', 'female'],
    ['Transgender', 'transgender'],
  ]
  RACE_VALUES = [
   ["Black", 'black'],
   ["Asian", 'asian'],
   ["Indian", 'indian'],
   ["Coloured", 'coloured'],
   ["White", 'white'],
  ]
  belongs_to :user
  has_many :orders
  has_many :users, :through => :order
  has_attached_file :photo, :styles => { :medium => "200x200>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validate :select_atleast_one_fuel_cook, :select_atleast_one_fuel_heat
  validates :first_name, :last_name, :address,:mobile, :id_pp, :user_id, :number_in_household, :terms_agreed, :start_date, presence: true
  validates :mobile, uniqueness: true


  def select_atleast_one_fuel_cook
    unless fuel_cook.drop_while {|i| i[1] == '0'}.present?
      errors.add(:fuel_cook, "Select at least one value")
    end
  end

    def select_atleast_one_fuel_heat
    unless fuel_heat.drop_while {|i| i[1] == '0'}.present?
      errors.add(:fuel_heat, "Select at least one value")
    end
  end



  def fullname
    "#{self.first_name} #{self.last_name}"
  end

  def full_name
    fullname
  end

  enum sex: %w(male female transgender)
  enum race: %w(black asian indian coloured white)

def self.as_csv
  CSV.generate do |csv|
    csv << [ "Customer Id", "First Name", "Last Name", "Customer Mobile", "Agent Id", "Agent Name", "Franchise Id", "Franchise Name"]
    all.each do |item|
     csv << [item.id, item.first_name, item.last_name, item.mobile, item.user_id, item.user.full_name, item.user.owner_id, item.user.owner.full_name]
    end
  end
end



end
