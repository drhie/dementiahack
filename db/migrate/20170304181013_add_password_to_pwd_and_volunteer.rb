class AddPasswordToResidentAndVolunteer < ActiveRecord::Migration[5.0]
  def change
    add_column(:volunteers, :password_digest, :string)
    add_column(:residents, :password_digest, :string)
  end
end
