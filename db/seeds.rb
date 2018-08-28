require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = 'pl'

estates = [
  {
    name: 'Osiedle Lecha',
    street: 'osiedle Lecha',
    city: 'Poznań',
    zip_code: '60-101'
  },
  {
    name: 'Osiedle Rusa',
    street: 'osiedle Rusa',
    city: 'Poznań',
    zip_code: '60-101'
  },
  {
    name: 'Helenki Wysokie',
    street: 'Ignacego Paderewskiego',
    city: 'Śrem',
    zip_code: '63-100'
  }
]

user_number = 1
for i in 0...3
  puts "Creating '#{estates[i][:name]}' estate"
  estate = Estate.create!(name: estates[i][:name])
  enotification = Enotification.create!(estate: estate,
                                        title: Faker::Pokemon.name,
                                        body: Faker::Lorem.sentence,
                                        valid_up_to_date: 10.days.from_now)
  for building_id in 1..5
    street = estates[i][:street]
    city = estates[i][:city]
    zip_code = estates[i][:zip_code]
    building = Building.create!(street:  street,
                               building_number: building_id,
                               city: city,
                               zip_code: zip_code,
                               estate: estate
                              )
    for apartment_number in 1..5
      apartment = Apartment.create!(
        apartment_number: apartment_number,
        building: building
      )
      user = User.new(
        email: "test#{user_number}@example.com",
        name: Faker::Name.first_name,
        surname: Faker::Name.last_name
      )
      user.skip_confirmation!
      user.password = 'qwerty'
      user.save
      user_number += 1
      ApartmentUser.create(
        apartment: apartment,
        user: user,
        status: 0
      )
      user = nil
    end
  end
end




puts "Estates, buildings and apartments seeds created"
