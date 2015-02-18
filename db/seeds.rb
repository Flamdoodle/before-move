# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# neighborhoods = [{name: "Queens", city_id: 1}, {name: "Bronx", city_id: 1}, name: "Hoboken", city_id: 1]
# restaurants = ["Nat's Tasting Collective", "Steve's House O' Greese", "Jolly Molly's", "Delicious Food Sold Here"]
# space_option = [{name: "Chef's Table"}, {name: "Attic"}, {name: "Wine Cellar"}]
# cuisine_types = [{name: "Burgers"}, {name: "BBQ"}, {name: "Italian"}]
# states = [  ["AK", "Alaska"],
#             ["AL", "Alabama"],
#             ["AR", "Arkansas"],
#             ["AZ", "Arizona"],
#             ["CA", "California"],
#             ["CO", "Colorado"],
#             ["CT", "Connecticut"],
#             ["DC", "District of Columbia"],
#             ["DE", "Delaware"],
#             ["FL", "Florida"],
#             ["GA", "Georgia"],
#             ["HI", "Hawaii"],
#             ["IA", "Iowa"],
#             ["ID", "Idaho"],
#             ["IL", "Illinois"],
#             ["IN", "Indiana"],
#             ["KS", "Kansas"],
#             ["KY", "Kentucky"],
#             ["LA", "Louisiana"],
#             ["MA", "Massachusetts"],
#             ["MD", "Maryland"],
#             ["ME", "Maine"],
#             ["MI", "Michigan"],
#             ["MN", "Minnesota"],
#             ["MO", "Missouri"],
#             ["MS", "Mississippi"],
#             ["MT", "Montana"],
#             ["NC", "North Carolina"],
#             ["ND", "North Dakota"],
#             ["NE", "Nebraska"],
#             ["NH", "New Hampshire"],
#             ["NJ", "New Jersey"],
#             ["NM", "New Mexico"],
#             ["NV", "Nevada"],
#             ["NY", "New York"],
#             ["OH", "Ohio"],
#             ["OK", "Oklahoma"],
#             ["OR", "Oregon"],
#             ["PA", "Pennsylvania"],
#             ["RI", "Rhode Island"],
#             ["SC", "South Carolina"],
#             ["SD", "South Dakota"],
#             ["TN", "Tennessee"],
#             ["TX", "Texas"],
#             ["UT", "Utah"],
#             ["VA", "Virginia"],
#             ["VT", "Vermont"],
#             ["WA", "Washington"],
#             ["WI", "Wisconsin"],
#             ["WV", "West Virginia"],
#             ["WY", "Wyoming"] ]
# cities = [{name: "New York", state_id: 35}, {name: "Chicago", state_id: 15}, {name: "San Fransisco", state_id: 5}]

# states.each do |state|
#   State.create(name: state[0])
# end

# cities.each do |city|
#   City.create(city)
# end

# neighborhoods.each do |neighborhood|
#   Neighborhood.create(neighborhood)
# end

# space_option.each do |space_option|
#   SpaceOption.create(space_option)
# end

# cuisine_types.each do |cuisine_type|
#   CuisineType.create(cuisine_type)
# end

# restaurants.each do |restaurant|
#   restaurant = Restaurant.create(name: restaurant, street_address: "123 This Place", zipcode: "10125", description: "Best eats in town", city_id: 1, neighborhood: Neighborhood.all.sample, cuisine_type: CuisineType.all.sample)
#   3.times do |i|
#     restaurant.restaurant_space_options.create(space_option: SpaceOption.all[i], number_of_seats: rand(6)+11, minimum_spend: "$#{rand(1000)+1000}")
#   end
# end

# # DINING OPTION WILL BE BROKEN UNTIL FIXED # FIXTHIS

# 10.times do
#   event_location = Restaurant.all.sample
#   Event.create(restaurant: event_location, date: Time.now, number_of_seats: (rand(10) + 10), seat_cost: 70, max_tickets_per_member: 2, restaurant_space_option: RestaurantSpaceOption.where(restaurant: event_location).sample)
# end

# 30.times do
#   event_location = Restaurant.all.sample
#   Event.create(restaurant: event_location, date: Time.now - 1.day, time: Time.now, number_of_seats: (rand(10) + 10), seat_cost: 70, max_tickets_per_member: 2, restaurant_space_option: RestaurantSpaceOption.where(restaurant: event_location).sample)
# end

# 12.times do
#   event_location = Restaurant.all.sample
#   Event.create(restaurant: event_location, date: Time.now + 1.day, time: Time.now, number_of_seats: (rand(10) + 10), seat_cost: 70, max_tickets_per_member: 2, restaurant_space_option: RestaurantSpaceOption.where(restaurant: event_location).sample)
# end

# 7.times do
#   event_location = Restaurant.all.sample
#   Event.create(restaurant: event_location, date: Time.now + 2.day, time: Time.now, number_of_seats: (rand(10) + 10), seat_cost: 70, max_tickets_per_member: 2, restaurant_space_option: RestaurantSpaceOption.where(restaurant: event_location).sample)
# end

# 100.times do
#   Member.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password", street_address: Faker::Address.street_address, zipcode: Faker::Address.zip, phone_number: Faker::PhoneNumber.phone_number, membership_cost: 70, is_admin?: false, is_active?: true, referral_code: rand(10000).to_s, last_login: Time.now)
# end

# 100.times do
#   Member.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password", street_address: Faker::Address.street_address, zipcode: Faker::Address.zip, phone_number: Faker::PhoneNumber.phone_number, membership_cost: 70, is_admin?: false, is_active?: true, referral_code: rand(10000).to_s, last_login: Time.now - 1.day)
# end

# Event.all.each do |event|
#   6.times do
#     event.bookings.create(member: Member.all.sample, number_of_tickets: 2)
#   end
# end

# Member.create(first_name: "Nat", last_name: "Gelb", email: "nats.email@email.mail", password: "password", password_confirmation: "password", street_address: Faker::Address.street_address, zipcode: Faker::Address.zip, phone_number: Faker::PhoneNumber.phone_number, membership_cost: 70, is_admin?: true, is_active?: true, referral_code: "TastingCollective", last_login: Time.now)

# 50.times do
#   Inquery.create(name: Faker::Name.name, email: Faker::Internet.email, referral_code: "TastingCollective", zipcode: "10567")
# end

# Event.all.each do |event|
#   course_counter = 0
#   event.menu_name = Faker::Lorem.word
#   event.menu_description = Faker::Lorem.sentence
#   event.number_of_courses = 3
#   event.save
#   3.times do
#     event.menu_items.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence, course_number: (course_counter += 1))
#   end
# end
