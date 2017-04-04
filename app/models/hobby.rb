class Hobby < ApplicationRecord
  belongs_to :resident, optional: true
  belongs_to :volunteer, optional: true

  def self.setlist
    set = ["Cards", "Squash", "Ping Pong", "Dance", "Drawing", "Fantasy Sports", "Knitting", "Puzzles", "Pottery", "Yoga"]
  end

  def self.match_hobbies(user)
    hobbies = []
    matched_people = []
    if user.class.name == "Volunteer"
      user.hobbies.each do |user_hobby|
        Hobby.all.each do |hobby|
          if user_hobby.name == hobby.name && hobby.resident_id != nil
            hobbies << hobby
            matched_people << Resident.find(hobby.resident_id)
          end
        end
      end
    elsif user.class.name == "Resident"
      user.hobbies.each do |user_hobby|
        Hobby.all.each do |hobby|
          if user_hobby.name == hobby.name && hobby.volunteer_id != nil
            hobbies << hobby
            matched_people << Volunteer.find(hobby.volunteer_id)
          end
        end
      end
    end

    Match.match_people(hobbies, matched_people)
  end
end
