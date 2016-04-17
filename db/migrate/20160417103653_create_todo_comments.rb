class CreateTodoComments < ActiveRecord::Migration
  def change
    create_table :todo_comments do |t|
      t.integer :user_id
      t.string :comment
      t.integer :todo_id

      t.timestamps null: false
    end
  end
end
