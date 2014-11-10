class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :personone
      t.integer :persontwo

      t.timestamps
    end
  end
end
