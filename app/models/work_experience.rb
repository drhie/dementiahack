class WorkExperience < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist
    set = ["Retail", "Research", "Translation", "IT", "Accountant", "Charity and Voluntary Work", "Business Consulting", "Banking", "Computer Networking", "Broadcast Media", "Education", "Entertainment", "Farming", "Judiciary", "Insurance", "Graphic Design", "Hospitality", "Insurance", "Trade"]
  end

  def self.match_work_ex(user)
    match_results = Match.match_criteria(WorkExperience, user, user.work_experiences)
    Match.match_people(match_results[0], match_results[1])
  end
end
