class Volunteer < ApplicationRecord
  has_secure_password

  has_many :organizations, through: :residents
  has_many :matches
  has_many :residents, through: :matches
  #FIELDS
  has_many :availabilities
  has_many :hobbies
  has_many :cultural_backgrounds
  has_many :languages
  has_many :skills
  has_many :interactions
  has_many :work_experiences
  has_many :schoolings

  accepts_nested_attributes_for :hobbies, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :languages, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :cultural_backgrounds, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :interactions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :schoolings, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :work_experiences, reject_if: :all_blank, allow_destroy: true


end
