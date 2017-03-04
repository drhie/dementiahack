class CreateInteractions < ActiveRecord::Migration[5.0]
  def change
    create_table :interactions do |t|
      t.string :type
      t.integer :volunteer_id
      t.integer :pwd_id

      t.timestamps
    end
  end
end
