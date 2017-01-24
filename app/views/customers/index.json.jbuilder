json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :mobile, :address, :gps_location, :id_pp, :sex, :disabled, :race, :number_in_household, :terms_agreed, :start_date, :end_date, :end_date_reason, :power_pack_paid, :lease_stove, :stove_number, :installed, :fuel_cook, :fuel_heat
  json.url customer_url(customer, format: :json)
end
