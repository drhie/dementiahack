class Availability < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

  def self.check_availabilities(user) #This checks on the volunteer's end
    availabilities = []
    matched_people = []
    ranked_matched_people = []
    user.availabilities.each do |user_availability|
      Availability.all.each do |availability|
        availabilities << availability if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
        availabilities << availability if user_availability.timeslot == availability.timeslot && availability.pwd_id == nil if user.class.name == "Pwd"
        matched_people << Pwd.find(availability.pwd_id) if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(availability.volunteer_id) if user_availability.timeslot == availability.timeslot && availability.pwd_id == nil if user.class.name == "Pwd"
      end
    end

    matched_people.each do |person|
      matched_counter = 0
      availabilities.each do |availability|
        matched_counter += 1 if availability.volunteer_id == person.id || availability.pwd_id == person.id
      end
      ranked_matched_people << [person.id, matched_counter] if !ranked_matched_people.include?([person.id, matched_counter])
    end
    ranked_matched_people
  end


end
