class Skill < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

  def self.match_skills(user)
    skills = []
    matched_people = []
    ranked_matched_people = []
    user.skills.each do |user_skill|
      Skill.all.each do |skill|
        skills << skill if user_skill.name == skill.name && skill.volunteer_id == nil if user.class.name == "Volunteer"
        skills << skill if user_skill.name == skill.name && skill.pwd_id == nil if user.class.name == "Pwd"
        matched_people << Pwd.find(skill.pwd_id) if user_skill.name == skill.name && skill.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(skill.volunteer_id) if user_skill.name == skill.name && skill.pwd_id == nil if user.class.name == "Pwd"
      end
    end

    matched_people.each do |person|
      matched_counter = 0
      skills.each do |skill|
        matched_counter += 1 if skill.volunteer_id == person.id || skill.pwd_id == person.id
      end
      ranked_matched_people << [person.id, matched_counter] if !ranked_matched_people.include?([person.id, matched_counter])
    end
    ranked_matched_people
  end

end
