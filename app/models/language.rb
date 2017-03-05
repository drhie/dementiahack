class Language < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

  def self.match_languages(user)
    languages = []
    matched_people = []
    ranked_matched_people = []
    user.languages.each do |user_lang|
      Language.all.each do |lang|
        languages << lang if user_lang.language == lang.language && lang.volunteer_id == nil if user.class.name == "Volunteer"
        languages << lang if user_lang.language == lang.language && lang.pwd_id == nil if user.class.name == "Pwd"
        matched_people << Pwd.find(lang.pwd_id) if user_lang.language == lang.language && lang.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(lang.volunteer_id) if user_lang.language == lang.language && lang.pwd_id == nil if user.class.name == "Pwd"
      end
    end

    matched_people.each do |person|
      matched_counter = 0
      languages.each do |lang|
        matched_counter += 1 if lang.volunteer_id == person.id || lang.pwd_id == person.id
      end
      ranked_matched_people << [person.id, matched_counter] if !ranked_matched_people.include?([person.id, matched_counter])
    end
    ranked_matched_people
  end


end
