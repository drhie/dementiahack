class CulturalBackground < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist
    set = ['German', 'Indian', 'Korean', 'Chinese']
  end

  def self.match_cultural_backgrounds(user)
    match_results = Match.match_criteria(CulturalBackground, user, user.cultural_backgrounds)
    Match.match_people(match_results[0], match_results[1])
  end
end
