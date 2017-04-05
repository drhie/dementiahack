class Skill < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.match_skills(user)
    match_results = Match.match_criteria(Skill, user, user.skills)
    Match.match_people(match_results[0], match_results[1])
  end

end
