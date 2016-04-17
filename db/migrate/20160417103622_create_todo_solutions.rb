class CreateTodoSolutions < ActiveRecord::Migration
  def change
    create_table :todo_solutions do |t|
      t.integer :user_id
      t.string :solution

      t.timestamps null: false
    end
  end
end
