class AddAttachmentAvatarToAttends < ActiveRecord::Migration
  def self.up
    change_table :attends do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :attends, :avatar
  end
end
