# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attendance do
    event
    friend
    state "initial"
    comment ""
  end
end
