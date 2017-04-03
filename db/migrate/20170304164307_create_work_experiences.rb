class CreateWorkExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :work_experiences do |t|
      t.string :industry
      t.integer :resident_id
      t.integer :volunteer_id

      t.timestamps
    end
  end
end
