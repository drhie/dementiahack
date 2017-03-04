class Volunteer < ApplicationRecord
  has_secure_password

  has_many :organizations, through: :pwds
  has_many :matches
  has_many :pwds, through: :matches
  #FIELDS
  has_many :availabilities
  has_many :hobbies
  has_many :cultural_backgrounds
  has_many :languages
  has_many :skills
  has_many :interactions
  has_many :work_experiences
  has_many :schoolings

  accepts_nested_attributes_for :hobbies, :languages
end
