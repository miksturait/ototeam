# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    state 'initial'
    name { Faker::Movie.title }
    description { Faker::Lorem.sentence }
    start_at { (rand(10) + 1).days.from_now }
    invite_from { start_at - 8.hours }
    invite_to { start_at - 2.hours }
    attendees_min_count { rand(5) }
    attendees_max_count { attendees_min_count + rand(5) }
    minutes_for_answer 60
    public_attendees_list false

    trait :with_creator do
      association :creator, factory: :user
    end

    trait :with_attendances do
      after(:create) do |event|
        2.times { event.friends << create(:friend, creator: event.creator) }
      end
    end
  end
end
