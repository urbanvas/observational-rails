# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Neil", email: "neil@neil.com", password_digest: "neil")
Observation.create(name: "first obv", user_id: 1)
System.create(name: "solar_first", observation_id: 1)
Planet.create(name: "earth_1", observation_id: 1, system_id: 1)
