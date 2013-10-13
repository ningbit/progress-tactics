# intialize JobClass first
j = JobClass.new
j.name = "Squire"
j.save

# then initialize User
u = User.new(first_name: "Fan",last_name: "Yap")
u.team = Team.new
u.save

topic = Topic.new(name: "Ruby")
topic.save

c = Character.new
c.topic = topic

u.team.characters << c

u.save

