class Match < ApplicationRecord
  belongs_to :volunteer
  belongs_to :resident

  def self.calculate_match(user)
    Match.destroy_all
    hashes = []
    match_hash = Hash.new
    match_criteria = [
      Availability.check_availabilities(user),
      Hobby.match_hobbies(user),
      CulturalBackground.match_cultural_backgrounds(user),
      Interaction.match_interactions(user),
      Language.match_languages(user),
      Skill.match_skills(user),
      Schooling.match_schoolings(user),
      WorkExperience.match_work_ex(user)
    ]
    match_criteria.each { |match| hashes << match }
    hashes.each do |hash|
      hash.each do |m|
        if match_hash.has_key?(m[0])
          match_hash[m[0]] += m[1]
        else
          match_hash[m[0]] = m[1]
        end
      end
    end
    match_hash.each do |match|
      Match.create(resident_id: user.id, volunteer_id: match[0], match_score: match[1]) if Match.where(resident_id: user.id, volunteer_id: match[0]).empty?
    end
    Match.all.where(resident_id: user.id).order(match_score: :desc)
  end

  def self.match_people(criteria_arr, matched_people)
    ranked_matched_people = []
    matched_people.each do |person|
      matched_counter = 0
      criteria_arr.each do |e|
        matched_counter += 1 if e.volunteer_id == person.id || e.resident_id == person.id
      end
      ranked_matched_people << [person.id, matched_counter] if !ranked_matched_people.include?([person.id, matched_counter])
    end
    ranked_matched_people
  end

end
