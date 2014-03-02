# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friend do
    creator_id 1
    user_id 2
    fullname { [Faker::Name.first_name, Faker::Name.last_name].join(' ') }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
  end
end
