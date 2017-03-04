class ChangeTypeToInteraction < ActiveRecord::Migration[5.0]
  def change
    remove_column(:interactions, :type, :string)
    add_column(:interactions, :interaction, :string)
  end
end
