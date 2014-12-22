# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cities = ["New York", "Chicago"]
restaurants = ["Nat's Tasting Collective", "Steve's House O' Greese", "Jolly Molly's", "Delicious Food Sold Here"]

cities.each do |city|
  City.create(name: city)
end

restaurants.each do |restaurant|
  Restaurant.create(name: restaurant, address: "123 This Place", description: "Best eats in town", city_id: 1)
end

10.times do
  Event.create(restaurant: Restaurant.all.sample, date: Time.now, number_of_seats: (rand(10) + 10), seat_cost: 70, max_tickets_per_member: 2)
end

100.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", address: Faker::Address.street_address, zipcode: Faker::Address.zip, phone_number: Faker::PhoneNumber.phone_number, membership_cost: 70, admin_status: false, active_status: true, referral_code: Faker::Internet.password)
end

40.times do
  Event.all.sample.bookings.create(user: User.all.sample, number_of_tickets: 1)
end