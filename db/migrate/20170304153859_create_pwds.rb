class CreatePwds < ActiveRecord::Migration[5.0]
  def change
    create_table :pwds do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :email
      t.integer   :organization_id, default: nil
      t.timestamps
    end
  end
end
