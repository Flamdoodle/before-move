# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cities = [{name: "New York", state: "NY"}, {name: "Chicago", state: "IL"}, {name: "San Fransisco", state: "CA"}]
restaurants = ["Nat's Tasting Collective", "Steve's House O' Greese", "Jolly Molly's", "Delicious Food Sold Here"]
space_option = ["Chef's Table", "Attic", "Wine Cellar"]

cities.each do |city|
  City.create(city)
end

restaurants.each do |restaurant|
  restaurant = Restaurant.create(name: restaurant, street_address: "123 This Place", zipcode: "10125", description: "Best eats in town", city_id: 1)
  space_option = ["Chef's Table", "Attic", "Wine Cellar"]
  3.times do |i|
    space_options.create(space_option: space_option[i-1])
  end
end

# DINING OPTION WILL BE BROKEN UNTIL FIXED # FIXTHIS

10.times do
  event_location = Restaurant.all.sample
  Event.create(restaurant: event_location, date: Time.now, number_of_seats: (rand(10) + 10), seat_cost: 70, max_tickets_per_member: 2, space_option: SpaceOption.where(dining_option: event_location.dining_options.sample).sample)
end

30.times do
  event_location = Restaurant.all.sample
  Event.create(restaurant: event_location, date: Time.now - 1.day, time: Time.now, number_of_seats: (rand(10) + 10), seat_cost: 70, max_tickets_per_member: 2, space_option: SpaceOption.where(dining_option: event_location.dining_options.sample).sample)
end

12.times do
  event_location = Restaurant.all.sample
  Event.create(restaurant: event_location, date: Time.now + 1.day, time: Time.now, number_of_seats: (rand(10) + 10), seat_cost: 70, max_tickets_per_member: 2, space_option: SpaceOption.where(dining_option: event_location.dining_options.sample).sample)
end

7.times do
  event_location = Restaurant.all.sample
  Event.create(restaurant: event_location, date: Time.now + 2.day, time: Time.now, number_of_seats: (rand(10) + 10), seat_cost: 70, max_tickets_per_member: 2, space_option: SpaceOption.where(dining_option: event_location.dining_options.sample).sample)
end

100.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", address: Faker::Address.street_address, zipcode: Faker::Address.zip, phone_number: Faker::PhoneNumber.phone_number, membership_cost: 70, is_admin?: false, is_active?: true, referral_code: rand(10000).to_s, last_login: Time.now)
end

100.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", address: Faker::Address.street_address, zipcode: Faker::Address.zip, phone_number: Faker::PhoneNumber.phone_number, membership_cost: 70, is_admin?: false, is_active?: true, referral_code: rand(10000).to_s, last_login: Time.now - 1.day)
end

Event.all.each do |event|
  6.times do
    event.bookings.create(user: User.all.sample, number_of_tickets: 2)
  end
end

User.create(first_name: "Nat", last_name: "Gelb", email: "nats.email@email.mail", password: "password", address: Faker::Address.street_address, zipcode: Faker::Address.zip, phone_number: Faker::PhoneNumber.phone_number, membership_cost: 70, is_admin?: true, is_active?: true, referral_code: "TastingCollective", last_login: Time.now)

50.times do
  Inquery.create(name: Faker::Name.name, email: Faker::Internet.email, referral_code: "TastingCollective", zipcode: "10567")
end

Event.all.each do |event|
  course_counter = 0
  menu = event.menus.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence, number_of_courses: 3)
  3.times do
    menu.menu_items.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence, course_number: (course_counter += 1))
  end
end