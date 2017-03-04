class AddPasswordToPwdAndVolunteer < ActiveRecord::Migration[5.0]
  def change
    add_column(:volunteers, :password_digest, :string)
    add_column(:pwds, :password_digest, :string)
  end
end
