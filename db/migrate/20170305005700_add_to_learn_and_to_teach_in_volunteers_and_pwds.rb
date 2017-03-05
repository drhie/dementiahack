class AddToLearnAndToTeachInVolunteersAndPwds < ActiveRecord::Migration[5.0]
  def change
    add_column(:pwds, :to_teach, :text)
    add_column(:volunteers, :to_learn, :text)
  end
end
