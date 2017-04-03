class CreateCulturalBackgrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :cultural_backgrounds do |t|
      t.string :background
      t.integer :volunteer_id
      t.integer :resident_id

      t.timestamps
    end
  end
end
