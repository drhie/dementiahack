class Pwd < ApplicationRecord
  has_secure_password

  has_many :matches
  belongs_to :organization
  has_many :volunteers, through: :matches
  #FIELDS
  has_many :availabilities
  has_many :hobbies
  has_many :cultural_backgrounds
  has_many :languages
  has_many :skills
  has_many :interactions
  has_many :work_experiences
  has_many :schoolings

end
