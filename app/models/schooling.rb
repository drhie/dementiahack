class Schooling < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist_names
    set = ["University of Toronto", "University of Waterloo", "University of Windsor", "George Brown College", "McMaster University", "Laurentian University", "OCAD University", "Queen's University", "Ryerson University", "Trent University", "University of Guelph", "University of Ontario Institute of Technology", "University of Ottawa", "Wilfrid Laurier University", "York University"]
  end

  def self.setlist_levels
    set = ["High School", "Postsecondary", "Graduate", "Doctorate", "Undergrad"]
  end

  def self.setlist_specializations
    set = ["Genetics", "Commerce", "International Relations", "Computer Science"]
  end

  def self.match_schoolings(user)
    schoolings = []
    matched_people = []
    ranked_matched_people = []
    user.schoolings.each do |user_schooling|
      Schooling.all.each do |schooling|
        schoolings << schooling if user_schooling.specialization == schooling.specialization && schooling.volunteer_id == nil if user.class.name == "Volunteer"
        schoolings << schooling if user_schooling.specialization == schooling.specialization && schooling.resident_id == nil if user.class.name == "Resident"
        matched_people << Resident.find(schooling.resident_id) if user_schooling.specialization == schooling.specialization && schooling.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(schooling.volunteer_id) if user_schooling.specialization == schooling.specialization && schooling.resident_id == nil if user.class.name == "Resident"
      end
    end

    Match.match_people(schoolings, matched_people)
  end

end
