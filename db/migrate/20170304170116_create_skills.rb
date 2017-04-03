class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :resident_id
      t.integer :volunteer_id

      t.timestamps
    end
  end
end
