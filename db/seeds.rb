# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# --- DESTROY

# Destroy users
puts "---------------------------------------------------------------"
puts "-- Destroying existing Users... -------------------------------"
puts "---------------------------------------------------------------"
User.destroy_all
puts "Done!"

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



# Create Skills
puts "---------------------------------------------------------------"
puts "-- Populating new skills... -----------------------------------"
puts "---------------------------------------------------------------"

skills = %w(ruby rails php react vue.js php java javascript node.js swift)

20.times do
  skill = skills.sample
  Skill.create!(name: skill)
  puts "Created skill #{skill}"
end
puts "Done creating skills!"
skills = Skill.all

# Create Students
puts "---------------------------------------------------------------"
puts "-- Populating new students... ---------------------------------"
puts "---------------------------------------------------------------"

Student.create!(username: 'henrialb', name: 'Henrique Albuquerque', picture_url: 'https://kitt.lewagon.com/placeholder/users/henrialb', opt_in: 1, description: "I'm French, grew up in Paris region. Experience in Finance in Paris & London (M&A & Private Equity). Lived in Paris, London, Hong Kong (exchange student) and Shanghai. In my job I tried my hand on some patchwork vba code. Always wanted to learn coding and now is the time ! I hope it will help me make automate a number of things at my job to help my colleagues and I spend more time on thinking and less on robotic tasks.", batch: '683')
Student.create!(username: 'tauzel', name: 'Thierry Auzel', picture_url: 'https://kitt.lewagon.com/placeholder/users/tauzel', opt_in: 1, description: "Curious mind who likes to build stuff that makes life easier. Amateur athlete, lover of music and photography, eager to learn. Better by the sea.", batch: '683')
Student.create!(username: 'ratzan', name: 'Pedro Rato', picture_url: 'https://kitt.lewagon.com/placeholder/users/ratzan', opt_in: 1, description: "I am a Translation student looking to get started in a new area and expand my knowledge, hoping to connect with like minded individuals and learn from each other.", batch: '683')
Student.create!(username: 'ArturRenzenbrink', name: 'Artur Renzenbrink', picture_url: 'https://kitt.lewagon.com/placeholder/users/ArturRenzenbrink', opt_in: 1, description: "Hello I am currently a Student(double bachelor in BBA and Data Analytics) learning web development at le wagon. I am from Hamburg, Germany but currently live in Madrid, Spain", batch: '683')
Student.create!(username: 'catiafalagueira', name: 'Cátia Falagueira', picture_url: 'https://kitt.lewagon.com/placeholder/users/catiafalagueira', opt_in: 1, description: "I worked as a Visual merchandising and Trainer coach in fashion industry. For me it's important to have balance in my life (personal life and professional). Learn to code is an opportunity to expand myself, be more flexible and create the life i want to live.", batch: '683')
Student.create!(username: 'louro-ines', name: 'Inês Louro', picture_url: 'https://kitt.lewagon.com/placeholder/users/louro-ines', opt_in: 1, description: "I have a Business Management Degree and a Human Resources Management Master's Degree and I've previously worked as a Quality Manager. I've wanted to learn to code to be able to change my career path and work as a developer.", batch: '683')
Student.create!(username: 'David2Luis', name: 'David Mendes Luís', picture_url: 'https://kitt.lewagon.com/placeholder/users/David2Luis', opt_in: 1, description: "David Luís 26 years old From: Lisbon, Portugal Just a retired triathlete trying to find a new challenging live style. I wanted to learn code for a while and now it's the time for that.", batch: '683')
Student.create!(username: 'macafadeal', name: 'Mateus Albuquerque', picture_url: 'https://kitt.lewagon.com/placeholder/users/macafadeal', opt_in: 1, description: "Wed 28 Jul 2021 I'm a Brazilian student who has lived abroad from the age of 7. I've lived in Dubai, Madrid, and am now based in Lisbon. Furthermore, I have completed my high school education successfully, and have attempted 3 separate Bachelor's degrees in Informatics Engineering & Video game Design (UEM) and Sociology (ISCTE-IUL), but have dropped out from all of them due to personal struggles and dissatisfaction with the courses, mostly due to their general orientation towards research as opposed to practicality and working skills. For these reasons, I have opted to join Le Wagon and pursuit a career in IT programming, and aspire to make a main career out of this profession.", batch: '683')
Student.create!(username: 'marianadkobayashi', name: 'Mariana Kobayashi', picture_url: 'https://kitt.lewagon.com/placeholder/users/marianadkobayashi', opt_in: 1, description: "I have a Double Bsc in Economics and International Business and a passion for the tech world. As for the future, I hope to work in digital venture creation.", batch: '683')
Student.create!(username: 'G-Souza-99', name: 'Gabriel Souza', picture_url: 'https://kitt.lewagon.com/placeholder/users/G-Souza-99', opt_in: 1, description: "Student as IT Business Management. From Portugal, always studied in English. Joined Le Wagon to expand my knowledge in the area after gently touching the subject at uni.", batch: '683')
Student.create!(username: 'Ajguerra28', name: 'António Guerra', picture_url: 'https://kitt.lewagon.com/placeholder/users/Ajguerra28', opt_in: 1, description: "I've studied programming in highschool but never continued to practice what i've learned. I want to learn coding so I can work on something I really like to do. After Le Wagon I wan't to gather experience in the field so I can open a IT Consultant later.", batch: '683')
puts "Created masters as students: Henrique, Thierry, Pedro, Artur"

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

# Create Users
puts "---------------------------------------------------------------"
puts "-- Populating chimp masters -----------------------------------"
puts "---------------------------------------------------------------"

student_id_h = Student.where(username: 'henrialb').last.id
student_id_t = Student.where(username: 'tauzel').last.id
student_id_p = Student.where(username: 'ratzan').last.id
student_id_a = Student.where(username: 'ArturRenzenbrink').last.id

User.create!(email: 'h@gig.com', password: '123123', name: 'Henrique Albuquerque', student_id: student_id_h)
User.create!(email: 't@gig.com', password: '123123', name: 'Thierry Auzel', student_id: student_id_t)
User.create!(email: 'p@gig.com', password: '123123', name: 'Pedro Rato', student_id: student_id_p)
User.create!(email: 'a@gig.com', password: '123123', name: 'Artur Renzenbrink', student_id: student_id_a)

puts "Users created"
users = User.all

# Create Gigs
puts "---------------------------------------------------------------"
puts "-- Populating new gigs... -------------------------------------"
puts "---------------------------------------------------------------"

10.times do
  master_id = users.sample.id
  name = Faker::Military.space_force_rank
  start_date = Faker::Date.between(from: rand(0..10).days.ago, to: rand(0..3).days.from_now)
  end_date = start_date + rand(5..10).days
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
