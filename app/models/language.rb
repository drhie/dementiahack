class Language < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist
    set = ['English', 'Hindi', 'Korean', 'Japanese', 'German', 'Chinese', 'Spanish', 'French', "Portugese", "Bengali", "Russian", "Swedish"]
  end

  def self.match_languages(user)
    languages = []
    matched_people = []
    ranked_matched_people = []
    user.languages.each do |user_lang|
      Language.all.each do |lang|
        languages << lang if user_lang.language == lang.language && lang.volunteer_id == nil if user.class.name == "Volunteer"
        languages << lang if user_lang.language == lang.language && lang.resident_id == nil if user.class.name == "Resident"
        matched_people << Resident.find(lang.resident_id) if user_lang.language == lang.language && lang.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(lang.volunteer_id) if user_lang.language == lang.language && lang.resident_id == nil if user.class.name == "Resident"
      end
    end

    Match.match_people(languages, matched_people)
  end


end
