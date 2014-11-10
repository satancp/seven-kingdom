class AddFileAttachmentAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :file_avatar
    end
  end

  def self.down
    remove_attachment :users, :file_avatar
  end
end
