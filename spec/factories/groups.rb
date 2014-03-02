# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    creator_id 1
    name { Faker::Lorem.word }
  end
end
