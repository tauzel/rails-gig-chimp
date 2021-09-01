# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# --- DESTROY

# Destroy students
puts "---------------------------------------------------------------"
puts "-- Destroying existing Students... ----------------------------"
puts "---------------------------------------------------------------"
Student.destroy_all
puts "Done!"

# Destroy gigs
puts "---------------------------------------------------------------"
puts "-- Destroying existing Gigs... --------------------------------"
puts "---------------------------------------------------------------"
Gig.destroy_all
puts "Done!"

# Destroy users
puts "---------------------------------------------------------------"
puts "-- Destroying existing Users... -------------------------------"
puts "---------------------------------------------------------------"
User.destroy_all
puts "Done!"

# Destroy skills
puts "---------------------------------------------------------------"
puts "-- Destroying existing Skills... ------------------------------"
puts "---------------------------------------------------------------"
Skill.destroy_all
puts "Done!"

# Destroy student_skills
puts "---------------------------------------------------------------"
puts "-- Destroying existing Student Skills... ----------------------"
puts "---------------------------------------------------------------"
StudentSkill.destroy_all
puts "Done!"

# Destroy gig_students
puts "---------------------------------------------------------------"
puts "-- Destroying existing Gig Students... ------------------------"
puts "---------------------------------------------------------------"
GigStudent.destroy_all
puts "Done!"

# --- CREATE

# Create Users
puts "---------------------------------------------------------------"
puts "-- Populating chimp masters -----------------------------------"
puts "---------------------------------------------------------------"

User.create!(email: "p@gig.com", password: "123123")
User.create!(email: "h@gig.com", password: "123123")
User.create!(email: "a@gig.com", password: "123123")
User.create!(email: "t@gig.com", password: "123123")

puts "Users created"
users = User.all

# Create Skills
puts "---------------------------------------------------------------"
puts "-- Populating new students... ---------------------------------"
puts "---------------------------------------------------------------"

20.times do
  skill = Faker::ProgrammingLanguage.unique.name
  Skill.create!(name: skill)
  puts "Created skill #{skill}"
end
puts "Done creating skills!"
skills = Skill.all

# Create Students
puts "---------------------------------------------------------------"
puts "-- Populating new students... ---------------------------------"
puts "---------------------------------------------------------------"

50.times do |i|
  name = Faker::Name.name
  username = Faker::Internet.username(specifier: name)
  description = Faker::Hipster.paragraph(sentence_count: 3)
  picture = "https://kitt.lewagon.com/placeholder/users/random#{i}"
  batch = rand(1..683)

  Student.create!(username: username, name: name, picture_url: picture, opt_in: 1, description: description, batch: batch)
  puts "Created student #{name}"
end

puts "Done creating students!"
students = Student.all

# Create Student Skills

students.each do |student|
  rand(2..7).times do
    skill = skills.sample
    StudentSkill.create!(student_id: student.id, skill_id: skill.id)
    puts "#{student.name} knows #{skill.name}."
  end
end
puts "Done adding skills to students!"

# Create Gigs
puts "---------------------------------------------------------------"
puts "-- Populating new gigs... -------------------------------------"
puts "---------------------------------------------------------------"

10.times do
  master_id = users.sample.id
  name = Faker::Military.space_force_rank
  start_date = Faker::Date.between(from: rand(0..10).days.ago, to: rand(0..3).days.from_now)
  end_date = start_date + rand(3..10).days
  description = Faker::Quote.famous_last_words

  Gig.create!(user_id: master_id, name: name, start: start_date, end: end_date, description: description)
  puts "Created gig #{name}"
end

puts "Done creating gigs!"
gigs = Gig.all

# Create Gig Students
gigs.each do |gig|
  rand(2..16).times do
    student = students.sample
    GigStudent.create!(gig_id: gig.id, student_id: student.id)
    puts "Added #{student.name} to project #{gig.name}."
  end
end
puts "Done adding chimps to gigs!"

puts "---------------------------------------------------------------"
puts "-- Finished! over to you Boss ---------------------------------"
puts "---------------------------------------------------------------"
