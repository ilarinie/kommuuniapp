class AddTodoSolutionIdToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :todo_solution_id, :integer
  end
end
