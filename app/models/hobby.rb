class Hobby < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist
    set = ["Cards", "Squash", "Ping Pong", "Dance", "Drawing", "Fantasy Sports", "Knitting", "Puzzles", "Pottery", "Yoga"]
  end

  def self.match_hobbies(user)
    match_results = Match.match_criteria(Hobby, user, user.hobbies)
    Match.match_people(match_results[0], match_results[1])
  end
end
