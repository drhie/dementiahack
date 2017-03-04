class AddCityNeighborhoodToPwdAndVolunteer < ActiveRecord::Migration[5.0]
  def change
    add_column(:volunteers, :neighborhood, :string)
    add_column(:volunteers, :city, :string)
    add_column(:pwds, :neighborhood, :string)
    add_column(:pwds, :city, :string)
  end
end
