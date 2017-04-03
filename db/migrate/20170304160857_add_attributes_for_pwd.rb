class AddAttributesForResident < ActiveRecord::Migration[5.0]
  def change
    add_column(:residents, :age, :integer)
    add_column(:residents, :active, :boolean)
  end
end
