# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.delete_all
Company.create([{name: 'Elite Rehab Placement'}, {name: 'Monarch Shores'}, {name: 'Solid Landings'}, {name: 'Willow Springs Recovery'}])

User.delete_all
user = User.new(email: 'admin@example.com', password:  'password123', password_confirmation: 'password123', admin: true)
user.save(validate: false)