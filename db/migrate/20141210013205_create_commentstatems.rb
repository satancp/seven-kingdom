class CreateCommentstatems < ActiveRecord::Migration
  def change
    create_table :commentstatems do |t|
      t.integer :user_id
      t.integer :micropost_id
      t.string :state

      t.timestamps
    end
  end
end
