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

class Order < ActiveRecord::Base
  #before_save :default_values

  belongs_to :customer
  belongs_to :product

  validates :customer_id, :product_id, :status, :reference, presence: true
  STATUS = ["New", "Processing by Franchise", "Available for Agent", "Processing by Agent", "Delivered", "Complete", "Cancelled"]
  AGENT_STATUS = ["Processing by Agent", "Delivered"]
  FRANCHISE_STATUS = ["Processing by Franchise", "Available for Agent"]

  def self.import(file)
    message = []
    CSV.foreach(file.path) do |row|
      customer  = Customer.find_by(mobile: row[0])
      product = Product.find_by(price: row[1])
      if customer.present? && product.present?
        Order.create!(product: product, customer: customer, status: "New", reference: row[2])
      else
        message << "#{row[0]} and #{row[1]} and #{row[2]} "
      end
    end
    message
  end # end self.import(file)

  def self.as_csv(status=nil, from=nil, to=nil)
    CSV.generate do |csv|
      csv << [ 'Order Id', 'Mobile',  'Customer',  'Agent', 'Franchise', 'Product', 'Order Created Date',  'Status']
      conditions = {}
      conditions[:status] = status if status.present?
      conditions[:created_at] = from...to if from.present?
      self.where(conditions).each do |item|
        csv << [
          item.id,
          (item.customer.mobile rescue "Not Provided"),
          (item.customer.full_name  rescue "Not Provided"),
          (item.customer.user.full_name  rescue "Not Provided"),
          (item.customer.user.owner.full_name  rescue "Not Provided"),
          (item.product.name  rescue "Not Provided"), 
          item.created_at.strftime("%m/%d/%Y"),
          item.status
        ]
      end
    end
  end

end
