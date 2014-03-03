# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class AddInitialGroup < ActiveRecord::Migration
  def up
    5.times do |i|
     Group.in("grupa ##{i}")
    end
  end

  def down
   Group.destroy_all
  end
end