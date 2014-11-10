class CreateCommentstates < ActiveRecord::Migration
  def change
    create_table :commentstates do |t|
      t.integer :user_id
      t.integer :info_id
      t.string :state

      t.timestamps
    end
  end
end
