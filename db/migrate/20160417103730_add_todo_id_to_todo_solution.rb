class AddTodoIdToTodoSolution < ActiveRecord::Migration
  def change
    add_column :todo_solutions, :todo_id, :integer
  end
end
