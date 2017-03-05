class Interaction < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

  def self.match_interactions(user)
    interactions = []
    matched_people = []
    ranked_matched_people = []
    user.interactions.each do |user_int|
      Interaction.all.each do |int|
        interactions << int if user_int.interaction == int.interaction && int.volunteer_id == nil if user.class.name == "Volunteer"
        interactions << int if user_int.interaction == int.interaction && int.pwd_id == nil if user.class.name == "Pwd"
        matched_people << Pwd.find(int.pwd_id) if user_int.interaction == int.interaction && int.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(int.volunteer_id) if user_int.interaction == int.interaction && int.pwd_id == nil if user.class.name == "Pwd"
      end
    end

    matched_people.each do |person|
      matched_counter = 0
      interactions.each do |element|
        matched_counter += 1 if element.volunteer_id == person.id || element.pwd_id == person.id
      end
      ranked_matched_people << [person.id, matched_counter] if !ranked_matched_people.include?([person.id, matched_counter])
    end
    ranked_matched_people
  end



end
