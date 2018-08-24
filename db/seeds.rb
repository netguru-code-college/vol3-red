require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = 'pl'

5.times do
  estate_name = Faker::Address.country
  Estate.create!(name: estate_name)
end

puts "Estates seeds created"

20.times do
  street = Faker::Address.street_name
  building_number = Faker::Address.building_number
  city = Faker::Address.city
  zip_code = Faker::Address.zip_code
  Building.create!(street:  street,
                   building_number: building_number,
                   city: city,
                   zip_code: zip_code,
                   estate_id: rand(1..5)
                  )
end

puts "Buildings seeds created"

150.times do |apartment|
  Apartment.create!(
    apartment_number: apartment,
    building_id: rand(1..20)
  )
end

puts "Apartments seeds created"

50.times do
  User.create(email: 'test@example.com',
              encrypted_password: '#$taawktljasktlw4aaglj')
end

puts "Users seeds created"
