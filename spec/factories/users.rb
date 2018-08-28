FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Date.today }
  end
end
