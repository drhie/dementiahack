class Skill < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.match_skills(user)
    skills = []
    matched_people = []
    ranked_matched_people = []
    user.skills.each do |user_skill|
      Skill.all.each do |skill|
        skills << skill if user_skill.name == skill.name && skill.volunteer_id == nil if user.class.name == "Volunteer"
        skills << skill if user_skill.name == skill.name && skill.resident_id == nil if user.class.name == "Resident"
        matched_people << Resident.find(skill.resident_id) if user_skill.name == skill.name && skill.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(skill.volunteer_id) if user_skill.name == skill.name && skill.resident_id == nil if user.class.name == "Resident"
      end
    end

    Match.match_people(skills, matched_people)
  end

end
