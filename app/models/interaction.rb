class Interaction < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist
    set = ["Individual", "Small Group", "Large Group"]
  end

  def self.match_interactions(user)
    interactions = []
    matched_people = []
    ranked_matched_people = []
    user.interactions.each do |user_int|
      Interaction.all.each do |int|
        interactions << int if user_int.interaction == int.interaction && int.volunteer_id == nil if user.class.name == "Volunteer"
        interactions << int if user_int.interaction == int.interaction && int.resident_id == nil if user.class.name == "Resident"
        matched_people << Resident.find(int.resident_id) if user_int.interaction == int.interaction && int.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(int.volunteer_id) if user_int.interaction == int.interaction && int.resident_id == nil if user.class.name == "Resident"
      end
    end

    Match.match_people(interactions, matched_people)
  end

end
