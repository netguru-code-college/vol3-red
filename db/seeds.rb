require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
  street = Faker::Address.street_name
  building_number = Faker::Address.building_number
  city = Faker::Address.city
  zip_code = Faker::Address.zip_code
Builiding.create!(street:  street,
                  building_number: building_number,
                  city: city,
                  zip_code: zip_code)
end
puts "buildings seeds created"


estates = Estate.create([{ id: 0, name: "Miodowy zakątek"}, { id: 1, name: "Daremne żale"}])

10.times do |apartment|
  Skill.create!(
    apartment_number: apartment
  )
end
puts "Apartment seeds created"


