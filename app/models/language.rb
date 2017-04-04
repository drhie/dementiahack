class Language < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist
    set = ['English', 'Hindi', 'Korean', 'Japanese', 'German', 'Chinese', 'Spanish', 'French', "Portugese", "Bengali", "Russian", "Swedish"]
  end

  def self.match_languages(user)
    match_results = Match.match_criteria(Language, user, user.languages)
    Match.match_people(match_results[0], match_results[1])
  end


end
