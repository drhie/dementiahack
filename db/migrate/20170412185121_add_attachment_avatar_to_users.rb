class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :volunteers do |t|
      t.attachment :avatar
    end
    change_table :residents do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :volunteers, :avatar
    remove_attachment :residents, :avatar
  end
end
