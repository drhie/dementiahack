class Volunteer < ApplicationRecord
  has_many :organizations, through: :pwds
  has_many :matches
  has_many :pwds, through: :matches
end
