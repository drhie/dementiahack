class AddLocationToResidentsAndVolunteers < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteers, :location, :string
    add_column :residents, :location, :string
  end
end
