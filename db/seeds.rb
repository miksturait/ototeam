# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
I18n.enforce_available_locales = false
puts "work"
  Group.destroy_all
  Friend.destroy_all
  25.times do |i|
     Group.create(name: "grupa #{i}")
  end

  25.times do |t|
    Friend.create(name: "kolega nr #{t}", email: "kolega_nr_#{t}@ruby.pl", numer_tel: "{t}{t}{t}{t}{t}{t}")
  end


