# intialize JobClass first

j1 = JobClass.create!(name: "Squire")
j2 = JobClass.create!(name: "Archer")
j3 = JobClass.create!(name: "Thief")
j4 = JobClass.create!(name: "Lancer")
j5 = JobClass.create!(name: "Samurai")
j6 = JobClass.create!(name: "Knight")
j7 = JobClass.create!(name: "Monk")
j8 = JobClass.create!(name: "Geomancer")
j9 = JobClass.create!(name: "Ninja")
j10 = JobClass.create!(name: "Chemist")
j11 = JobClass.create!(name: "Priest")
j12 = JobClass.create!(name: "Oracle")
j13 = JobClass.create!(name: "Mediator")
j14 = JobClass.create!(name: "Wizard")
j15 = JobClass.create!(name: "Time Mage")
j16 = JobClass.create!(name: "Summoner")
j17 = JobClass.create!(name: "Calculator")
j18 = JobClass.create!(name: "Bard")
j19 = JobClass.create!(name: "Dancer")
j20 = JobClass.create!(name: "Mime")





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

