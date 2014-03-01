class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :state
      t.string :name
      t.text :description
      t.datetime :start_at
      t.datetime :invite_from
      t.datetime :invite_to
      t.integer :attendees_min_count
      t.integer :attendees_max_count
      t.integer :minutes_for_answer
      t.boolean :public_attendees_list
      t.integer :creator_id

      t.timestamps
    end
  end
end
