class CreateTodoUsers < ActiveRecord::Migration
  def change
    create_table :todo_users do |t|
      t.integer :user_id
      t.integer :todo_id

      t.timestamps null: false
    end
  end
end
