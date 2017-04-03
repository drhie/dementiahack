class AddAgeStringsToVolunteerAndResident < ActiveRecord::Migration[5.0]
  def change
    add_column(:volunteers, :age, :string)
    change_column(:residents, :age, :string)
  end
end
