class Match < ApplicationRecord
  belongs_to :volunteer
  belongs_to :pwd

  def self.calculate_match(user)
    hashes = []
    match_hash = Hash.new
    hashes << Availability.check_availabilities(user)
    hashes << Hobby.match_hobbies(user)
    hashes << CulturalBackground.match_cultural_backgrounds(user)
    hashes << Interaction.match_interactions(user)
    hashes.each do |hash|
      hash.each do |m|
      if match_hash.has_key?(m[0])
        match_hash[m[0]] += m[1]
      else
        match_hash[m[0]] = m[1]
      end
    end
  end

  match_hash.each do |match|
    Match.create(pwd_id: user.id, volunteer_id: match[0], match_score: match[1]) if Match.where(pwd_id: user.id, volunteer_id: match[0]).empty?
  end
  Match.all.where(pwd_id: user.id).order(match_score: :desc)

  end
end
