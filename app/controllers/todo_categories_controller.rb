class TodoCategoriesController < ApplicationController
  before_action :set_todo_category, only: [:edit, :show]

def new
  @todo_category = TodoCategory.new
end

def show
  @todos = Todo.where(private:false).where(todo_category_id:@todo_category.id).where(todo_solution_id:nil).paginate(:page => params[:page]).order(created_at: :desc)
  @comp_todos = Todo.where(todo_category_id:@todo_category.id).where.not(todo_solution_id:nil).paginate(:page => params[:comppage]).order(created_at: :desc)
  @categories = TodoCategory.all
end

def edit
end

def create
  @todo_category = TodoCategory.new(todo_category_params)
  if @todo_category.save
    redirect_to :root, notice: 'New Todo-category added'
  else
    render :new
  end
end

def update
  if @TodoCategory.update(todo_category_params)
    redirect_to :root, notice: 'Todo category updated.'
  else
    render :edit
  end
end

private

def todo_category_params
  params.require(:todo_category).permit(:name)
end

def set_todo_category
  @todo_category = TodoCategory.find(params[:id])
end

end
