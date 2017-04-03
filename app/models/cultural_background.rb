class CulturalBackground < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.match_cultural_backgrounds(user)
    cultural_backgrounds = []
    matched_people = []
    ranked_matched_people = []
    user.cultural_backgrounds.each do |user_cultural_background|
      CulturalBackground.all.each do |cultural_background|
        cultural_backgrounds << cultural_background if user_cultural_background.background == cultural_background.background && cultural_background.volunteer_id == nil if user.class.name == "Volunteer"
        cultural_backgrounds << cultural_background if user_cultural_background.background == cultural_background.background && cultural_background.resident_id == nil if user.class.name == "Resident"
        matched_people << Resident.find(cultural_background.resident_id) if user_cultural_background.background == cultural_background.background && cultural_background.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(cultural_background.volunteer_id) if user_cultural_background.background == cultural_background.background && cultural_background.resident_id == nil if user.class.name == "Resident"
      end
    end



    matched_people.each do |person|
      matched_counter = 0
      cultural_backgrounds.each do |cultural_background|
        matched_counter += 1 if cultural_background.volunteer_id == person.id || cultural_background.resident_id == person.id
      end
      ranked_matched_people << [person.id, matched_counter] if !ranked_matched_people.include?([person.id, matched_counter])
    end
    ranked_matched_people
  end
end
