class AddToLearnAndToTeachInVolunteersAndResidents < ActiveRecord::Migration[5.0]
  def change
    add_column(:residents, :to_teach, :text)
    add_column(:volunteers, :to_learn, :text)
  end
end
