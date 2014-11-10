class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.integer :age
      t.string :gender
      t.string :power
      t.string :love
      t.timestamps
    end
  end
end
