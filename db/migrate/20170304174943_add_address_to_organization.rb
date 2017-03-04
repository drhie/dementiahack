class AddAddressToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column(:organizations, :full_address, :string)
  end
end
