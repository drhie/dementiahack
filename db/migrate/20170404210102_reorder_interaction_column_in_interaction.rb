class ReorderInteractionColumnInInteraction < ActiveRecord::Migration[5.0]
  def change
    drop_table :interactions
    create_table :interactions do |t|
      t.string  :interaction
      t.integer :volunteer_id
      t.integer :resident_id

      t.timestamps
    end
  end
end
