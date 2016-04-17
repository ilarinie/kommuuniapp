class TodoSolutionsController < ApplicationController
before_action :ensure_that_signed_in


def create
  @solution = TodoSolution.new(solution_params)
  @solution.user_id = current_user.id


  if @solution.save
    t = Todo.find(solution_params[:todo_id]).update(todo_solution_id:@solution.id)
    redirect_to :back, notice: 'TODO solved succesfully'
  else
    redirect_to :back, alert: 'Error, try again'
  end

end

def destroy
  redirect_to :root, alert: 'Not implemented yet'
end

private

def solution_params
  params.require(:todo_solution).permit(:solution,:todo_id)
end

end
