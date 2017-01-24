class AddReferenceFieldToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :reference, :string
  end
end
