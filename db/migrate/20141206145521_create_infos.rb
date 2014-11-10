class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.integer :user_id
      t.integer :infotype_id
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
