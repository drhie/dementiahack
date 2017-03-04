class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.string :timeslot
      t.integer :pwd_id
      t.integer :volunteer_id

      t.timestamps
    end
  end
end
