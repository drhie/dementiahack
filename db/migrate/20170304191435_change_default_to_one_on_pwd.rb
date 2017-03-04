class ChangeDefaultToOneOnPwd < ActiveRecord::Migration[5.0]
  def change
    change_column :pwds, :organization_id, :integer, default: 1
  end
end
