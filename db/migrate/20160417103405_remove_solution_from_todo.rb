class RemoveSolutionFromTodo < ActiveRecord::Migration
  def change
    remove_column :todos, :solver_id
    remove_column :todos, :solve_time
    remove_column :todos, :solution
  end
end
