class Hobby < ApplicationRecord
  belongs_to :pwd, optional: true
  belongs_to :volunteer, optional: true

end
