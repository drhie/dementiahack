class WorkExperience < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist
    set = ["Retail", "Research", "Translation", "IT", "Accountant", "Charity and Voluntary Work", "Business Consulting", "Banking", "Computer Networking", "Broadcast Media", "Education", "Entertainment", "Farming", "Judiciary", "Insurance", "Graphic Design", "Hospitality", "Insurance", "Trade"]
  end

  def self.match_work_ex(user)
    work_exp = []
    matched_people = []
    ranked_matched_people = []
    user.work_experiences.each do |user_work_ex|
      WorkExperience.all.each do |work_ex|
        work_exp << work_ex if user_work_ex.industry == work_ex.industry && work_ex.volunteer_id == nil if user.class.name == "Volunteer"
        work_exp << work_ex if user_work_ex.industry == work_ex.industry && work_ex.resident_id == nil if user.class.name == "Resident"
        matched_people << Resident.find(work_ex.resident_id) if user_work_ex.industry == work_ex.industry && work_ex.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(work_ex.volunteer_id) if user_work_ex.industry == work_ex.industry && work_ex.resident_id == nil if user.class.name == "Resident"
      end
    end

    matched_people.each do |person|
      matched_counter = 0
      work_exp.each do |work_ex|
        matched_counter += 1 if work_ex.volunteer_id == person.id || work_ex.resident_id == person.id
      end
      ranked_matched_people << [person.id, matched_counter] if !ranked_matched_people.include?([person.id, matched_counter])
    end
    ranked_matched_people
  end

end
