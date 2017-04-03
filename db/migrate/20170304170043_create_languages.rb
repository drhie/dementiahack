class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :language
      t.integer :resident_id
      t.integer :volunteer_id

      t.timestamps
    end
  end
end
