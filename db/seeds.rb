# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker' # Génère les jeux de données aléatoires
require 'database_cleaner' # Vide la database et permet de reaprtir de l'index 0

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

2.times do		#cree 10 users
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Marketing.buzzwords, email: Faker::Internet.email, password: 'password', password: 'password')
end

puts "2 utilisateurs créés"

30.times do
  Event.create(title: Faker::Book.title, duration: [10, 25, 45].sample, start_date: Faker::Time.forward(days: 365), description: Faker::ChuckNorris.fact, price: rand(1..1000), location: Faker::Address.city, orga_id: User.all.sample.id)
end

puts "30 évènements créés"
