# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "---------------------------------------------------------------"
puts "-- Destroying existing Students... ----------------------------"
puts "---------------------------------------------------------------"

Student.destroy_all

puts "---------------------------------------------------------------"
puts "-- Populating new Students... ---------------------------------"
puts "---------------------------------------------------------------"

50.times do |i|
  name = Faker::Name.name
  puts "Created #{name}"
  username = Faker::Internet.username(specifier: name)
  description = Faker::Hipster.paragraph(sentence_count: 3)
  picture = "https://kitt.lewagon.com/placeholder/users/random#{i}"
  batch = rand(1..683)

  Student.create!(username: username, name: name, picture_url: picture, opt_in: 1, description: description, batch: batch)
end

puts "---------------------------------------------------------------"
puts "-- Finished! over to you Boss ---------------------------------"
puts "---------------------------------------------------------------"

User.destroy_all
User.create!(email: "p@gmail.com", password: "123123")
User.create!(email: "h@hotmail.com", password: "123123")
User.create!(email: "a@gmail.com", password: "123123")
User.create!(email: "t@hotmail.com", password: "123123")
