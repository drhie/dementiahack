class Hobby < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

  def self.match_hobbies(user)
    hobbies = []
    matched_people = []
    ranked_matched_people = []
    user.hobbies.each do |user_hobby|
      Hobby.all.each do |hobby|
        hobbies << hobby if user_hobby.name == hobby.name && hobby.volunteer_id == nil if user.class.name == "Volunteer"
        hobbies << hobby if user_hobby.name == hobby.name && hobby.pwd_id == nil if user.class.name == "Pwd"
        matched_people << Pwd.find(hobby.pwd_id) if user_hobby.name == hobby.name && hobby.volunteer_id == nil if user.class.name == "Volunteer"
        matched_people << Volunteer.find(hobby.volunteer_id) if user_hobby.name == hobby.name && hobby.pwd_id == nil if user.class.name == "Pwd"
      end
    end

    matched_people.each do |person|
      matched_counter = 0
      hobbies.each do |hobby|
        matched_counter += 1 if hobby.volunteer_id == person.id || hobby.pwd_id == person.id
      end
      ranked_matched_people << [person, matched_counter] if !ranked_matched_people.include?([person, matched_counter])
    end
    ranked_matched_people
  end



end
