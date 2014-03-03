class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.text :description
      t.datetime :invite_start
      t.datetime :inivite_stop
      t.integer :user_min
      t.integer :user_max
      t.string :time
      t.boolean :join
      t.boolean :public

      t.timestamps
    end
  end
end
