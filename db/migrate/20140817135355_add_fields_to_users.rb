class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :text
    add_column :users, :id_pp, :string
    add_column :users, :sex, :string
    add_column :users, :disabled, :string
    add_column :users, :race, :string
    add_column :users, :agreed, :string
    add_column :users, :phone, :string
    add_column :users, :fax, :string
    add_column :users, :starts_at, :datetime
    add_column :users, :ends_at, :datetime
    add_column :users, :role, :integer
  end
end
