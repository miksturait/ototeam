# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    start_time "2014-02-27 23:00:56"
    description "MyText"
    invite_start "2014-02-27 23:00:56"
    inivite_stop "2014-02-27 23:00:56"
    user_min 1
    user_max 1
    time "MyString"
    join false
    public false
  end
end
