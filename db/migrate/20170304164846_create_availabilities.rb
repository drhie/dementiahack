class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.boolean :mon_m
      t.boolean :mon_a
      t.boolean :mon_e
      t.boolean :tue_m
      t.boolean :tue_a
      t.boolean :tue_e
      t.boolean :wed_m
      t.boolean :wed_a
      t.boolean :wed_e
      t.boolean :thu_m
      t.boolean :thu_a
      t.boolean :thu_e
      t.boolean :fri_m
      t.boolean :fri_a
      t.boolean :fri_e
      t.boolean :sat_m
      t.boolean :sat_a
      t.boolean :sat_e
      t.boolean :sun_m
      t.boolean :sun_a
      t.boolean :sun_e
      t.integer :pwd_id
      t.integer :volunteer_id

      t.timestamps
    end
  end
end
