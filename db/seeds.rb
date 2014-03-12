ActiveRecord::Base.transaction do
  user = FactoryGirl.create(:user)
  FactoryGirl.create_list(:event, 10, creator: user)
  FactoryGirl.create_list(:past_event, 10, creator: user)
  FactoryGirl.create_list(:friend, 10, creator: user)
  FactoryGirl.create_list(:group, 10, creator: user)
  puts "User: #{user.email} Password: secret"

  additional_event = FactoryGirl.create(:event, :with_creator, :with_attendances)
  puts "User: #{additional_event.creator.email} Password: secret"
end
