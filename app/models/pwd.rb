class Pwd < ApplicationRecord
  has_many :matches
  belongs_to :organization
  has_many :volunteers, through: :matches
  has_one :availability
end
