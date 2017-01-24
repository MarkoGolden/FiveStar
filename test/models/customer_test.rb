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

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
