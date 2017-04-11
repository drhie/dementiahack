# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hobbies = Hobby.setlist
@interaction = Interaction.setlist
@language = Language.setlist
@school = Schooling.setlist_names
@level = Schooling.setlist_levels
@specialization = Schooling.setlist_specializations
@industry = WorkExperience.setlist
@cultural_background = CulturalBackground.setlist
@availability = Availability.setlist
@age_ranges = ['Under 18', '18-24', '25-29', '30-34', '35-39', '40-44', '45-49', '50-54', '55-59', '60-64', '65-69', '70+']

Availability.destroy_all
CulturalBackground.destroy_all
Hobby.destroy_all
Interaction.destroy_all
Language.destroy_all
Match.destroy_all
Organization.destroy_all
Resident.destroy_all
Schooling.destroy_all
Volunteer.destroy_all
WorkExperience.destroy_all

50.times do
  p = Volunteer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    to_learn: "How to be more proactive in the community",
    password: "password",
    age: @age_ranges.sample
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
# Resident.create(
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
#   resident_id: 1
# )
#
# Hobby.create(
#   name: "Ping Pong",
#   resident_id: 1
# )
#
# Resident.create(
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
#   resident_id: 2
# )
#
# Hobby.create(
#   name: "Ping Pong",
#   resident_id: 2
# )
#
# Hobby.create(
#   name: "Squash",
#   resident_id: 2
# )
#
# Hobby.create(
#   name: "Soccer",
#   resident_id: 2
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
# resident_id: 1
# )
#
# Skill.create(
# name: "organization",
# resident_id: 1
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
#   resident_id: 1
# )
# Schooling.create(
#   specialization: "Genetics",
#   resident_id: 1
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
#   resident_id: 1
# )
# WorkExperience.create(
#   industry: "Research",
#   resident_id: 1
# )
#
# # Match.create(
# #   volunteer_id: 1,
# #   resident_id:       1
# # )
# #
# # Match.create(
# #   volunteer_id: 2,
# #   resident_id:       2
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
#   resident_id: 1
# )
#
# Availability.create(
#   timeslot: "Monday",
#   resident_id: 1
# )
