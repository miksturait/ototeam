ActiveRecord::Base.transaction do
  user = FactoryGirl.create(:user)
  FactoryGirl.create_list(:event, 10, creator: user)
  FactoryGirl.create_list(:friend, 10, creator: user)
  FactoryGirl.create_list(:group, 10, creator: user)
  puts "User: #{user.email} Password: secret"
end
