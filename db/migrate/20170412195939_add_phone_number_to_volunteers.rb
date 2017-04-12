class AddPhoneNumberToVolunteers < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteers, :phone_number, :string
  end
end
