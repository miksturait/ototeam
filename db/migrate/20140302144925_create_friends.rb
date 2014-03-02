class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.string :fullname
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
