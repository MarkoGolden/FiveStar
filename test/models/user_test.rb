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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
