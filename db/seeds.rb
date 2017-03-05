# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hobbies = ["Cards", "Squash", "Ping Pong", "Dance", "Drawing", "Fantasy Sports", "Knitting", "Puzzles", "Pottery", "Yoga"]
@interaction = ["Individual", "Small Group", "Large Group"]
@language = ['English', 'Hindi', 'Korean', 'Japanese', 'German', 'Chinese', 'Spanish', 'French', "Portugese", "Bengali", "Russian", "Swedish"]
@school = ["University of Toronto", "University of Waterloo", "University of Windsor", "George Brown College", "McMaster University", "Laurentian University", "OCAD University", "Queen's University", "Ryerson University", "Trent University", "University of Guelph", "University of Ontario Institute of Technology", "University of Ottawa", "Wilfrid Laurier University", "York University"]
@level = ["High School", "Postsecondary", "Graduate", "Doctorate", "Undergrad"]
@specialization = ["Genetics", "Commerce", "International Relations", "Computer Science"]
@industry = ["Retail", "Research", "Translation", "IT", "Accountant", "Charity and Voluntary Work", "Business Consulting", "Banking", "Computer Networking", "Broadcast Media", "Education", "Entertainment", "Farming", "Judiciary", "Insurance", "Graphic Design", "Hospitality", "Insurance", "Trade"]
@cultural_background = ['German', 'Indian', 'Korean', 'Chinese']
@availability = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Breakfast', 'Lunch', 'Evening', 'Morning', 'Afternoon', 'Evening']

Availability.destroy_all
CulturalBackground.destroy_all
Hobby.destroy_all
Interaction.destroy_all
Language.destroy_all
Match.destroy_all
Organization.destroy_all
Pwd.destroy_all
Schooling.destroy_all
Volunteer.destroy_all
WorkExperience.destroy_all

50.times do
  p = Volunteer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    to_learn: "How to be more proactive in the community",
    password: "password"
  )

  3.times do
    hobby = @hobbies.sample
    if p.hobbies.where(name: hobby).empty?
      p.hobbies.create!(
      name: @hobbies.sample,
      )
    end
  end

  p.cultural_backgrounds.create!(
    background: @cultural_background.sample,
  )

  p.interactions.create!(
    interaction: @interaction.sample,
  )

  p.languages.create!(
    language: @language.sample,
  )

  p.schoolings.create!(
    name: @school.sample,
    level: @level.sample,
    specialization: @specialization.sample,
  )

  p.work_experiences.create!(
    industry: @industry.sample
  )

  4.times do
    avail = @availability.sample
    if p.availabilities.where(timeslot: avail).empty?
      p.availabilities.create!(
        timeslot: avail
      )
    end
  end

end


# Volunteer.create(
#   first_name: "Dave",
#   last_name:  "Rhie",
#   email:      "dave@dave.com",
#   neighborhood: "Etobicoke",
#   city:        "Toronto",
#   password:   "asdf"
# )
#
# Hobby.create(
#   name: "Cards",
#   volunteer_id: 1
# )
#
# Hobby.create(
#   name: "Soccer",
#   volunteer_id: 1
# )
#
# Volunteer.create(
#   first_name: "Sahani",
#   last_name:  "Sahani",
#   email:      "sahani@dave.com",
#   neighborhood: "Scarborough",
#   city:        "Toronto",
#   password:   "asdf"
# )
#
# Hobby.create(
#   name: "Ping Pong",
#   volunteer_id: 2
# )
#
# Hobby.create(
#   name: "Squash",
#   volunteer_id: 2
# )
#
#
# Organization.create(
# name:       "Independent",
# )
#
# Organization.create(
#   name:       "Schlegel Villages",
#   email:      "sv@sv.com",
#   phone_number: "555-5555"
# )
#
# Organization.create(
#   name:       "Bitmaker Villages",
#   email:      "bv@sv.com",
#   phone_number: "556-5555",
# )
#
# Pwd.create(
#   first_name: "Rich",
#   last_name:   "Strauss",
#   email:      "rich@rich.com",
#   organization_id: 1,
#   neighborhood: "Etobicoke",
#   city:        "Toronto",
#   password:   "asdf",
# )
#
# Hobby.create(
#   name: "Cards",
#   pwd_id: 1
# )
#
# Hobby.create(
#   name: "Ping Pong",
#   pwd_id: 1
# )
#
# Pwd.create(
#   first_name: "Stephen",
#   last_name:   "Huang",
#   email:      "stephenh@rich.com",
#   organization_id: 1,
#   neighborhood: "Scarborough",
#   city:        "Toronto",
#   password:   "asdf",
# )
#
# Hobby.create(
#   name: "Cards",
#   pwd_id: 2
# )
#
# Hobby.create(
#   name: "Ping Pong",
#   pwd_id: 2
# )
#
# Hobby.create(
#   name: "Squash",
#   pwd_id: 2
# )
#
# Hobby.create(
#   name: "Soccer",
#   pwd_id: 2
# )
#
# Skill.create(
# name: "project management",
# volunteer_id: 1
# )
#
# Skill.create(
# name: "time management",
# volunteer_id: 1
# )
#
# Skill.create(
# name: "time management",
# pwd_id: 1
# )
#
# Skill.create(
# name: "organization",
# pwd_id: 1
# )
#
# Schooling.create(
#   specialization: "IT",
#   volunteer_id: 1
# )
# Schooling.create(
#   specialization: "Commerce",
#   volunteer_id: 1
# )
# Schooling.create(
#   specialization: "Commerce",
#   pwd_id: 1
# )
# Schooling.create(
#   specialization: "Genetics",
#   pwd_id: 1
# )
#
#
#
# WorkExperience.create(
#   industry: "Retail",
#   volunteer_id: 1
# )
# WorkExperience.create(
#   industry: "Research",
#   volunteer_id: 1
# )
# WorkExperience.create(
#   industry: "Retail",
#   pwd_id: 1
# )
# WorkExperience.create(
#   industry: "Research",
#   pwd_id: 1
# )
#
# # Match.create(
# #   volunteer_id: 1,
# #   pwd_id:       1
# # )
# #
# # Match.create(
# #   volunteer_id: 2,
# #   pwd_id:       2
# # )
#
# Availability.create(
#   timeslot: "Wednesday",
#   volunteer_id: 1
# )
#
# Availability.create(
#   timeslot: "Thursday",
#   volunteer_id: 1
# )
#
# Availability.create(
#   timeslot: "Wednesday",
#   pwd_id: 1
# )
#
# Availability.create(
#   timeslot: "Monday",
#   pwd_id: 1
# )
