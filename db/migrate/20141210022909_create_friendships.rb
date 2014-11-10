class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :personone
      t.integer :persontwo

      t.timestamps
    end
  end
end
