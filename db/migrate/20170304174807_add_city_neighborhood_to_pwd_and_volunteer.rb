class AddCityNeighborhoodToResidentAndVolunteer < ActiveRecord::Migration[5.0]
  def change
    add_column(:volunteers, :neighborhood, :string)
    add_column(:volunteers, :city, :string)
    add_column(:residents, :neighborhood, :string)
    add_column(:residents, :city, :string)
  end
end
