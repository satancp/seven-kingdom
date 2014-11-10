class CreateInfotypes < ActiveRecord::Migration
  def change
    create_table :infotypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
