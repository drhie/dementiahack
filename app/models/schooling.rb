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

  def self.match_school_name(user)
    match_results = Match.match_criteria(Schooling, user, user.schoolings)
    Match.match_people(match_results[0], match_results[1])
  end

  def self.match_school_level(user)
    match_results = Match.match_criteria(Schooling, user, user.schoolings, 4)
    Match.match_people(match_results[0], match_results[1])
  end

  def self.match_school_specialization(user)
    match_results = Match.match_criteria(Schooling, user, user.schoolings, 5)
    Match.match_people(match_results[0], match_results[1])
  end

end
