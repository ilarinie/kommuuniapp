class CreateChoreUsers < ActiveRecord::Migration
  def change
    create_table :chore_users do |t|
      t.integer :user_id
      t.integer :chore_id

      t.timestamps null: false
    end
  end
end
