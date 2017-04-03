class Organization < ApplicationRecord
  has_many :residents
  has_many :matches, through: :residents
  has_many :volunteers, through: :residents
end
