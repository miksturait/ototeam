# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friend do
    fullname { [Faker::Name.first_name, Faker::Name.last_name].join(' ') }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
  end
end
