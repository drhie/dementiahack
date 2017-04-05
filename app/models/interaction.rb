class Interaction < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist
    set = ["Individual", "Small Group", "Large Group"]
  end

  def self.match_interactions(user)
    match_results = Match.match_criteria(Interaction, user, user.interactions)
    Match.match_people(match_results[0], match_results[1])
  end
end
