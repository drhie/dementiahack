class Availability < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

  def self.check_availabilities(user) #This checks on the volunteer's end

    matched_availabilities = []
    non_matched_availabilities = []
    matched_people = []
    ranked_matched_people = []
    matched_ppl_non_matched_availability = []

    user.availabilities.each do |user_availability|
      Availability.all.each do |availability|
        matched_availabilities << availability if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
        matched_availabilities << availability if user_availability.timeslot == availability.timeslot && availability.pwd_id == nil if user.class.name == "Pwd"

        matched_people << Pwd.find(availability.pwd_id) if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(availability.volunteer_id) if user_availability.timeslot == availability.timeslot && availability.pwd_id == nil if user.class.name == "Pwd"
          end
        end

        @match_availabilities =  matched_availabilities


        Availability.all.each do |availability|
          non_matched_availabilities << availability.id if availability.pwd_id != user.id if user.class.name == "Pwd"
        end

        final_non_matched_availabilities = non_matched_availabilities
        matched_availabilities.each do |match|
          final_non_matched_availabilities.delete(match.id) if non_matched_availabilities.include?(match.id)
          end

        final_non_matched_availabilities

            final_non_matched_availabilities.each do |avail|
              matched_ppl_non_matched_availability << [Availability.find(avail).volunteer, Availability.find(avail).timeslot] if matched_people.include?(Volunteer.find(Availability.find(avail).volunteer_id))
            end




        matched_ppl_non_matched_availability

    matched_people.each do |person|
      matched_counter = 0
      matched_availabilities.each do |availability|
        matched_counter += 1 if availability.volunteer_id == person.id || availability.pwd_id == person.id
      end
      ranked_matched_people << [person.id, matched_counter] if !ranked_matched_people.include?([person.id, matched_counter])
    end
    ranked_matched_people
  end

  def self.matched_people_matched_availabilities(user)
    matched_availabilities = []
    non_matched_availabilities = []
    matched_people = []
    ranked_matched_people = []
    matched_ppl_non_matched_availability = []

    user.availabilities.each do |user_availability|
      Availability.all.each do |availability|
        matched_availabilities << availability if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
        matched_availabilities << availability if user_availability.timeslot == availability.timeslot && availability.pwd_id == nil if user.class.name == "Pwd"

        matched_people << Pwd.find(availability.pwd_id) if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(availability.volunteer_id) if user_availability.timeslot == availability.timeslot && availability.pwd_id == nil if user.class.name == "Pwd"
          end
        end
    matched_availabilities
  end

  def self.matched_people_non_matched_availabilities(user)

    matched_availabilities = []
    non_matched_availabilities = []
    matched_people = []
    ranked_matched_people = []
    matched_ppl_non_matched_availability = []

    user.availabilities.each do |user_availability|
      Availability.all.each do |availability|
        matched_availabilities << availability if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
        matched_availabilities << availability if user_availability.timeslot == availability.timeslot && availability.pwd_id == nil if user.class.name == "Pwd"

        matched_people << Pwd.find(availability.pwd_id) if user_availability.timeslot == availability.timeslot && availability.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(availability.volunteer_id) if user_availability.timeslot == availability.timeslot && availability.pwd_id == nil if user.class.name == "Pwd"
          end
        end

        @match_availabilities =  matched_availabilities


        Availability.all.each do |availability|
          non_matched_availabilities << availability.id if availability.pwd_id != user.id if user.class.name == "Pwd"
        end

        final_non_matched_availabilities = non_matched_availabilities
        matched_availabilities.each do |match|
          final_non_matched_availabilities.delete(match.id) if non_matched_availabilities.include?(match.id)
          end

        final_non_matched_availabilities

            final_non_matched_availabilities.each do |avail|
              matched_ppl_non_matched_availability << [Availability.find(avail).volunteer, Availability.find(avail).timeslot] if matched_people.include?(Volunteer.find(Availability.find(avail).volunteer_id))
            end

        matched_ppl_non_matched_availability
  end

end
