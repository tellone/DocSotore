# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(email: "o@mail.com", password: "ooooooooo", admin: false, approved: true)
User.create!(email: "filip.diloom@gmail.com", password: "glhf#hldesign", admin: true, approved: true)
