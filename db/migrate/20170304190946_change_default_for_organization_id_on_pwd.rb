class ChangeDefaultForOrganizationIdOnResident < ActiveRecord::Migration[5.0]
  def change
    change_column :residents, :organization_id, :integer, default: 0
  end
end
