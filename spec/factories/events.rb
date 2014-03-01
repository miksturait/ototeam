# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    state "MyString"
    name "MyString"
    description "MyText"
    start_at "2014-03-01 20:09:36"
    invite_from "2014-03-01 20:09:36"
    invite_to "2014-03-01 20:09:36"
    attendees_min_count 1
    attendees_max_count 1
    minutes_for_answer 1
    public_attendees_list false
    creator_id 1
  end
end
