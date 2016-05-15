class TodosController < ApplicationController
  before_action :ensure_that_signed_in
  before_action :set_todo, only: [:show, :destroy]

  def new
    @todo = Todo.new
    @categories = TodoCategory.all
  end

  def show
    redirect_to :root, notice: 'No permission to view todo' unless permission_to_view
    @solution = TodoSolution.new
  end

  def index
    @todos = Todo.where(private: false).where(todo_solution_id: nil).paginate(page: params[:page]).order(:due)
    @solvedtodos = Todo.where(private: false).where.not(todo_solution_id: nil).paginate(page: params[:page]).order(:due)
    @categories = TodoCategory.all
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.creator_id = current_user.id
    if @todo.save
      if @todo.private
        redirect_to user_path(current_user), notice: 'New private TODO created'
      else
        TelegramApi.send_to_channel current_user.to_s + " created a new todo titled '" + @todo.title + "'. Description: " + @todo.description + '.'
        redirect_to todos_path, notice: 'New TODO created'
      end
    else
      redirect_to :back, alert: 'Error, try again.'
    end
  end

  def destroy
    if permission_to_view
      @todo.delete
      redirect_to :root, notice: 'Todo succesfully deleted'
    else
      redirect_to :back, alert: 'No permission to delete todo.'
    end
  end

  private

  def permission_to_view
    if current_user.admin?
      true
    elsif @todo.private
      if current_user.id != @todo.creator_id
        false
      else
        true
      end
    else
      true
    end
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :todo_category_id, :due, :private)
  end
end
