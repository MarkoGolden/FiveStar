# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  fname              :string(255)
#  lname              :string(255)
#  email              :string(255)
#  mobile             :integer
#  created_at         :datetime
#  updated_at         :datetime
#  password_digest    :string(255)
#  address            :text
#  id_pp              :string(255)
#  sex                :string(255)
#  disabled           :string(255)
#  race               :string(255)
#  agreed             :string(255)
#  phone              :string(255)
#  fax                :string(255)
#  starts_at          :datetime
#  ends_at            :datetime
#  role               :integer
#  owner_id           :integer
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  status             :boolean
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :customers
  has_many :orders, through: :customers

  validates :fname, :lname, :email, presence: true

  #validate :password, :on => :create

  enum role: { admin: 0, franchise: 1, agent: 2 }

  belongs_to :owner, class_name: 'User'

  has_many :franchises, -> { where role: 1 }, class_name: 'User', foreign_key: :owner_id
  has_many :agents, -> { where role: 2 }, class_name: 'User', foreign_key: :owner_id

  has_attached_file :photo, :styles => { :medium => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def full_name
    "#{fname} #{lname}"
  end

  def fullname
    full_name
  end

  def all_agents
    case role
    when "admin"
      User.where(role: 2)
    when "franchise"
      agents
    when "agent"
      self
    end
  end

  def scoped_customers
    case role
    when "admin"
      Customer.all
    when "franchise"
      Customer.where(user_id: agent_ids)
    when "agent"
      customers
    end
  end


  def scoped_orders

  end

def self.as_csv
  CSV.generate do |csv|
    csv << [ "Name", "Mobile", "Email", "Role", "Franchise Name"]
    all.each do |item|
     csv << [item.fullname, item.mobile, item.email, item.role, (item.owner.fname if item.owner.present?)]
    end
  end
end

end
