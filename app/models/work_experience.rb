class WorkExperience < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

  def self.match_work_ex(user)
    work_exp = []
    matched_people = []
    ranked_matched_people = []
    user.work_experiences.each do |user_work_ex|
      WorkExperience.all.each do |work_ex|
        work_exp << work_ex if user_work_ex.industry == work_ex.industry && work_ex.volunteer_id == nil if user.class.name == "Volunteer"
        work_exp << work_ex if user_work_ex.industry == work_ex.industry && work_ex.pwd_id == nil if user.class.name == "Pwd"
        matched_people << Pwd.find(work_ex.pwd_id) if user_work_ex.industry == work_ex.industry && work_ex.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(work_ex.volunteer_id) if user_work_ex.industry == work_ex.industry && work_ex.pwd_id == nil if user.class.name == "Pwd"
      end
    end

    matched_people.each do |person|
      matched_counter = 0
      work_exp.each do |work_ex|
        matched_counter += 1 if work_ex.volunteer_id == person.id || work_ex.pwd_id == person.id
      end
      ranked_matched_people << [person.id, matched_counter] if !ranked_matched_people.include?([person.id, matched_counter])
    end
    ranked_matched_people
  end

end
