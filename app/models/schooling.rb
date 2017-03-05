class Schooling < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

  def self.match_schoolings(user)
    schoolings = []
    matched_people = []
    ranked_matched_people = []
    user.schoolings.each do |user_schooling|
      Schooling.all.each do |schooling|
        schoolings << schooling if user_schooling.specialization == schooling.specialization && schooling.volunteer_id == nil if user.class.name == "Volunteer"
        schoolings << schooling if user_schooling.specialization == schooling.specialization && schooling.pwd_id == nil if user.class.name == "Pwd"
        matched_people << Pwd.find(schooling.pwd_id) if user_schooling.specialization == schooling.specialization && schooling.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(schooling.volunteer_id) if user_schooling.specialization == schooling.specialization && schooling.pwd_id == nil if user.class.name == "Pwd"
      end
    end

    matched_people.each do |person|
      matched_counter = 0
      schoolings.each do |schooling|
        matched_counter += 1 if schooling.volunteer_id == person.id || schooling.pwd_id == person.id
      end
      ranked_matched_people << [person.id, matched_counter] if !ranked_matched_people.include?([person.id, matched_counter])
    end
    ranked_matched_people
  end

end
