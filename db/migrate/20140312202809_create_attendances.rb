class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :event_id
      t.integer :friend_id
      t.string :state
      t.text :comment

      t.timestamps
    end
  end
end
