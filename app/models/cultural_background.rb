class CulturalBackground < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

  def self.match_cultural_backgrounds(user)
    cultural_backgrounds = []
    user.cultural_backgrounds.each do |user_cultural_background|
      CulturalBackground.all.each do |cultural_background|
        cultural_backgrounds << cultural_background if user_cultural_background.background == cultural_background.background && cultural_background.volunteer_id == nil if user.class.name == "Volunteer"
        cultural_backgrounds << cultural_background if user_cultural_background.background == cultural_background.background && cultural_background.pwd_id == nil if user.class.name == "Pwd"
      end
    end
    cultural_backgrounds
  end

end
