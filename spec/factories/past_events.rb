# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :past_event, parent: :event do
    start_at { (rand(10) + 1).days.ago }
    invite_from { start_at - 8.hours }
    invite_to { start_at - 2.hours }
  end
end
