# Create admin
u = User.new
u.fname = "Willem"
u.lname = "5Star"
u.password = "5star"
u.password_confirmation = "5star"
u.email = "admin@example.com"
u.mobile = "4200539"
u.sex = "Male"
u.address = "Address of user goes here"
u.id_pp = "123123"
u.race = "Indian"
u.starts_at = "2014-08-29"
u.phone = "2280366"
u.agreed = "Yes"
u.status = "true"
u.role = 0
u.save!




# Create franchise1
u = User.new
u.fname = "Franchise 1"
u.lname = "5star"
u.password = "5star"
u.password_confirmation = "5star"
u.email = "franchise1@example.com"
u.mobile = "4200539"
u.sex = "Male"
u.address = "Address of user goes here"
u.id_pp = "123123"
u.race = "Indian"
u.starts_at = "2014-08-29"
u.phone = "2280366"
u.agreed = "Yes"
u.status = "true"
u.role = 1
u.owner_id = 1
u.save!


# Create franchise2
u = User.new
u.fname = "Franchise 2"
u.lname = "5star"
u.password = "5star"
u.password_confirmation = "5star"
u.email = "franchise2@example.com"
u.mobile = "4200539"
u.sex = "Male"
u.address = "Address of user goes here"
u.id_pp = "123123"
u.race = "Indian"
u.starts_at = "2014-08-29"
u.phone = "2280366"
u.agreed = "Yes"
u.status = "true"
u.role = 1
u.owner_id = 1
u.save!

# Create agent1
u = User.new
u.fname = "Agent 1"
u.lname = "5star"
u.password = "5star"
u.password_confirmation = "5star"
u.email = "agent1@example.com"
u.mobile = "4200539"
u.sex = "Male"
u.address = "Address of user goes here"
u.id_pp = "123123"
u.race = "Indian"
u.starts_at = "2014-08-29"
u.phone = "2280366"
u.agreed = "Yes"
u.status = "true"
u.role = 2
u.owner_id = 2
u.save!

# Create agent1
u = User.new
u.fname = "Agent 2"
u.lname = "5star"
u.password = "5star"
u.password_confirmation = "5star"
u.email = "agent2@example.com"
u.mobile = "4200539"
u.sex = "Male"
u.address = "Address of user goes here"
u.id_pp = "123123"
u.race = "Indian"
u.starts_at = "2014-08-29"
u.phone = "2280366"
u.agreed = "Yes"
u.status = "true"
u.role = 2
u.owner_id = 3
u.save!

# Create customer1
u = Customer.new
u.first_name = "Customer1"
u.last_name = "agent1"
u.mobile = "123456789"
u.address = "customer address goes here"
u.gps_location = "34223424"
u.id_pp = "3432423423"
u.sex = 1
u.disabled = "true"
u.race = 1
u.number_in_household = 3
u.terms_agreed = "true"
u.start_date = "2014-08-29"
u.power_pack_paid = "true"
u.lease_stove = "true"
u.stove_number = 5
u.installed = "true"
u.cook_coal = 1
u.heat_lpg = 1
u.user_id = 4
u.save!

# Create customer2
u = Customer.new
u.first_name = "Customer2"
u.last_name = "agent2"
u.mobile = "987654321"
u.address = "customer address goes here"
u.gps_location = "34223424"
u.id_pp = "3432423423"
u.sex = 1
u.disabled = "true"
u.race = 1
u.number_in_household = 3
u.terms_agreed = "true"
u.start_date = "2014-08-29"
u.power_pack_paid = "true"
u.lease_stove = "true"
u.stove_number = 5
u.installed = "true"
u.cook_coal = 1
u.heat_lpg = 1
u.user_id = 5
u.save!

# Create Product
u = Product.new
u.name = "5kg"
u.price = "60.00"
u.code = "p1"
u.save!
