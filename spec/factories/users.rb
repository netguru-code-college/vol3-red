FactoryBot.define do
  factory :user do
    email Faker::Internet.safe_email
    password 'password'
    password_confirmation 'password'
    confirmed_at Date.today
  end
end
