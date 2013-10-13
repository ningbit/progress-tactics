# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new(first_name: "Fan",last_name: "Yap")
u.team = Team.new
u.save

topic = Topic.new(name: "Ruby")
topic.save

c = Character.new
c.topic = topic

u.team.characters << c

u.save

j = JobClass.new
j.name = "Squire"
j.save