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

t1 = Topic.create!(name: "Ruby")
t2 = Topic.create!(name: "HTML")
t3 = Topic.create!(name: "SQL")
t4 = Topic.create!(name: "Bash")
t5 = Topic.create!(name: "Git")
t6 = Topic.create!(name: "CSS")


# then initialize User
u = User.new(first_name: "Ning",last_name: "Yap", email:"ning.yap@gmail.com")
u.team = Team.new
u.save

c1 = Character.create!(topic_id: t1.id)
c2 = Character.create!(topic_id: t2.id)
c3 = Character.create!(topic_id: t3.id)
c4 = Character.create!(topic_id: t4.id)
c5 = Character.create!(topic_id: t5.id)
c6 = Character.create!(topic_id: t6.id)

u.team.characters << [c1,c2,c3,c4,c5,c6]

c5.current_job_id = 10
c6.current_job_id = 10

c3.gender = "F"
c4.gender = "F"
c6.gender = "F"

c2.save
c3.save
c4.save
c5.save
c6.save

u.save

u.team.change_color(5)

# Initialize Type
type1 = Type.create!(name: "Tutorial")
type2 = Type.create!(name: "Coding")
type3 = Type.create!(name: "Reading")

# Intialize Tasks



