class IndexController < ApplicationController
  before_action :ensure_that_signed_in

  def index
    @chores = current_user.chores
    @users = User.active
    @todos = Todo.where("due < ?", Time.now+5.days).where(private:false).where(todo_solution_id:nil).paginate(page: params[:page]).order(:due).limit(5)
  end
end
