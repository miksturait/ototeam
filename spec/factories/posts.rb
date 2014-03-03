# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    name "MyString"
    description "MyText"
    active false
  end
end
