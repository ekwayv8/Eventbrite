# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'activerecord-reset-pk-sequence'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

#Permet de remettre à 0 les id des différents objets
User.reset_pk_sequence
Event.reset_pk_sequence
Attendance.reset_pk_sequence

10.times do
	first_name = Faker::Name.first_name 
	last_name = Faker::Name.last_name
	email = "#{first_name}.#{last_name}@yopmail.com"
	user = User.create!(email: email, encrypted_password: Faker::Internet.password,description: Faker::Movies::StarWars.quote, first_name: first_name, last_name: last_name)
end



10.times do
	duration = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
	event = Event.create!(start_date: Faker::Time.forward(days: 20), duration: duration.sample, title: Faker::Book.title, description: Faker::Lorem.words,price: rand(1..1000), location: Faker::Address.city, admin_id: rand(User.all.first.id..User.all.last.id) )
end



10.times do
	attendance = Attendance.create!(stripe_customer_id: Faker::Number.number(digits: 10), user_id: rand(User.all.first.id..User.all.last.id), event_id: rand(Event.all.first.id..Event.all.last.id))
end