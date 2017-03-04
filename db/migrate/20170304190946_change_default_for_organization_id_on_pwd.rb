class ChangeDefaultForOrganizationIdOnPwd < ActiveRecord::Migration[5.0]
  def change
    change_column :pwds, :organization_id, :integer, default: 0
  end
end
