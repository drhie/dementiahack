class Availability < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

  def self.check_availabilities(user) #This checks on the volunteer's end
    availabilities = []
    user.availabilities.each do |user_availability|
      Availability.all.each do |availability|
        availabilities << availability if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
        availabilities << availability if user_availability.timeslot == availability.timeslot && availability.pwd_id == nil if user.class.name == "Pwd"
      end
    end
    availabilities
  end
end
