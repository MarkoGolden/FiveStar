# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  status      :string(255)
#  product_id  :integer
#  customer_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  reference   :string(255)
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
