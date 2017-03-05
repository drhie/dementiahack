# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Volunteer.create(
  first_name: "Dave",
  last_name:  "Rhie",
  email:      "dave@dave.com",
  neighborhood: "Etobicoke",
  city:        "Toronto",
  password:   "asdf"
)

Hobby.create(
  name: "Cards",
  volunteer_id: 1
)

Hobby.create(
  name: "Soccer",
  volunteer_id: 1
)

Volunteer.create(
  first_name: "Sahani",
  last_name:  "Sahani",
  email:      "sahani@dave.com",
  neighborhood: "Scarborough",
  city:        "Toronto",
  password:   "asdf"
)

Hobby.create(
  name: "Ping Pong",
  volunteer_id: 2
)

Hobby.create(
  name: "Squash",
  volunteer_id: 2
)


Organization.create(
name:       "Independent",
)

Organization.create(
  name:       "Schlegel Villages",
  email:      "sv@sv.com",
  phone_number: "555-5555"
)

Organization.create(
  name:       "Bitmaker Villages",
  email:      "bv@sv.com",
  phone_number: "556-5555",
)

Pwd.create(
  first_name: "Rich",
  last_name:   "Strauss",
  email:      "rich@rich.com",
  organization_id: 1,
  neighborhood: "Etobicoke",
  city:        "Toronto",
  password:   "asdf",
)

Hobby.create(
  name: "Cards",
  pwd_id: 1
)

Hobby.create(
  name: "Ping Pong",
  pwd_id: 1
)

Pwd.create(
  first_name: "Stephen",
  last_name:   "Huang",
  email:      "stephenh@rich.com",
  organization_id: 1,
  neighborhood: "Scarborough",
  city:        "Toronto",
  password:   "asdf",
)

Hobby.create(
  name: "Cards",
  pwd_id: 2
)

Hobby.create(
  name: "Ping Pong",
  pwd_id: 2
)

Hobby.create(
  name: "Squash",
  pwd_id: 2
)

Hobby.create(
  name: "Soccer",
  pwd_id: 2
)

Skill.create(
name: "project management",
volunteer_id: 1
)

Skill.create(
name: "time management",
volunteer_id: 1
)

Skill.create(
name: "time management",
pwd_id: 1
)

Skill.create(
name: "organization",
pwd_id: 1
)

Schooling.create(
  specialization: "IT",
  volunteer_id: 1
)
Schooling.create(
  specialization: "Commerce",
  volunteer_id: 1
)
Schooling.create(
  specialization: "Commerce",
  pwd_id: 1
)
Schooling.create(
  specialization: "Genetics",
  pwd_id: 1
)



WorkExperience.create(
  industry: "Retail",
  volunteer_id: 1
)
WorkExperience.create(
  industry: "Research",
  volunteer_id: 1
)
WorkExperience.create(
  industry: "Retail",
  pwd_id: 1
)
WorkExperience.create(
  industry: "Research",
  pwd_id: 1
)

# Match.create(
#   volunteer_id: 1,
#   pwd_id:       1
# )
#
# Match.create(
#   volunteer_id: 2,
#   pwd_id:       2
# )

Availability.create(
  timeslot: "Wednesday",
  volunteer_id: 1
)

Availability.create(
  timeslot: "Thursday",
  volunteer_id: 1
)

Availability.create(
  timeslot: "Wednesday",
  pwd_id: 1
)

Availability.create(
  timeslot: "Monday",
  pwd_id: 1
)
