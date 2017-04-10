class Availability < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist
    ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Breakfast', 'Lunch', 'Evening', 'Morning', 'Afternoon', 'Evening']
  end

  def self.check_availabilities(user) #This checks on the volunteer's end
    match_results = Match.match_criteria(Availability, user, user.availabilities)
    Match.match_people(match_results[0], match_results[1])
  end

  def self.matched_people_matched_availabilities(user)
    matched_availabilities = []
    matched_people = []
    if user.class.name == "Volunteer"
      user.availabilities.each do |u_avail|
        Availability.all.each do |avail|
          if u_avail.timeslot == avail.timeslot && avail.resident_id != nil
            matched_availabilities << avail
          end
        end
      end
    elsif user.class.name == "Resident"
      user.availabilities.each do |u_avail|
        Availability.all.each do |avail|
          if u_avail.timeslot == avail.timeslot && avail.volunteer_id != nil
            matched_availabilities << avail
          end
        end
      end
    end
    matched_availabilities
  end

  #   user.availabilities.each do |user_availability|
  #     Availability.all.each do |availability|
  #       matched_availabilities << availability if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
  #       matched_availabilities << availability if user_availability.timeslot == availability.timeslot && availability.resident_id == nil if user.class.name == "Resident"
  #
  #       matched_people << Resident.find(availability.resident_id) if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
  #       matched_people << Volunteer.find(availability.volunteer_id) if user_availability.timeslot == availability.timeslot && availability.resident_id == nil if user.class.name == "Resident"
  #         end
  #       end
  #   matched_availabilities
  # end
end
