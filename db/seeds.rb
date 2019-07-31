# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create!(username: "vasy", email: "vasu", password: "vasu")
p = Planet.create!(name: "vasu")
s = System.create!(name: "vasu")
g = Galaxy.create!(name: "vasu")
o = Observation.create!(name: "first obv", user_id: 1, planet_id: 1, system_id: 1, galaxy_id: 1)