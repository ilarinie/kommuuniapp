class TodoSolutionsController < ApplicationController
before_action :ensure_that_signed_in


def create
  @solution = TodoSolution.new(solution_params)
  @solution.user_id = current_user.id


  if @solution.save
    t = Todo.find(solution_params[:todo_id])
    t.update(todo_solution_id:@solution.id)
    if not t.private
      TelegramApi.send_to_channel ""+User.find(@solution.user_id).to_s+" solved "+t.title+"! Solution: "+@solution.solution
    end
    redirect_to :back, notice: 'TODO solved succesfully'
  else
    redirect_to :back, alert: 'Error, try again'
  end

end


private

def solution_params
  params.require(:todo_solution).permit(:solution,:todo_id)
end

end
