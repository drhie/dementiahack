class Organization < ApplicationRecord
  has_many :pwds
  has_many :matches, through: :pwds
  has_many :volunteers, through: :pwds
end
