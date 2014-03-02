class AddCreatorIdToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :creator_id, :integer
  end
end
