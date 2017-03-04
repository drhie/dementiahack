class CreateSchoolings < ActiveRecord::Migration[5.0]
  def change
    create_table :schoolings do |t|
      t.string :name
      t.integer :pwd_id
      t.integer :volunteer_id
      t.string :level
      t.string :specialization

      t.timestamps
    end
  end
end
