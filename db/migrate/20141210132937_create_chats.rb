class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :friendship_id
      t.string :content
      t.integer :sendperson

      t.timestamps
    end
  end
end
