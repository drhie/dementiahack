class AddAttributesForPwd < ActiveRecord::Migration[5.0]
  def change
    add_column(:pwds, :age, :integer)
    add_column(:pwds, :active, :boolean)
  end
end
