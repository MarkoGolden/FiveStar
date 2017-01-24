class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.text :address
      t.string :gps_location
      t.string :id_pp
      t.integer :sex
      t.boolean :disabled
      t.integer :race
      t.integer :number_in_household
      t.boolean :terms_agreed
      t.date :start_date
      t.date :end_date
      t.text :end_date_reason
      t.boolean :power_pack_paid
      t.boolean :lease_stove
      t.string :stove_number
      t.boolean :installed
      t.hstore :cook_fuel
      t.hstore :cook_heat

      t.timestamps
    end
  end
end
