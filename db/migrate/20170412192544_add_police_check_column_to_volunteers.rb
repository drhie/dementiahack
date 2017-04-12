class AddPoliceCheckColumnToVolunteers < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :volunteers, :policecheck
  end

  def self.down
    remove_attachment :volunteers, :policecheck
  end
end
