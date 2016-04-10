class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name
      t.integer :priority
      t.integer :reward

      t.timestamps null: false
    end
  end
end
