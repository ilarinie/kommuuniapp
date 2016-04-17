class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :todo_user_id
      t.integer :solver_id
      t.string :title
      t.string :description
      t.integer :todo_category_id
      t.datetime :due
      t.string :solution
      t.boolean :private
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end
