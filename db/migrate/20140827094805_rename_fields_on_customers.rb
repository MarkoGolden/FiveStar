class RenameFieldsOnCustomers < ActiveRecord::Migration
  def change
    rename_column :customers, :cook_fuel, :fuel_cook
    rename_column :customers, :cook_heat, :fuel_heat
  end
end
