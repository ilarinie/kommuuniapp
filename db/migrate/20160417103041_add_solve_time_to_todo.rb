class AddSolveTimeToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :solve_time, :datetime
  end
end
