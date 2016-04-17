class UsersController < ApplicationController
  before_action :ensure_that_signed_in
  before_action :set_user, only: [:show]

  def show
    @refunds = Refund.where(receiver_id:current_user.id).where(confirmed:false)
    @pendrefunds = Refund.where(payer_id:current_user.id).where(confirmed:false)
    if @user == current_user
    @todos = Todo.where(creator_id:@user.id).where(private:true).where(todo_solution_id:nil).paginate(:page => params[:page]).order(:due)
    @comptodos = Todo.where(creator_id:@user.id).where(private:true).where.not(todo_solution_id:nil).paginate(:page => params[:comppage]).order(:due)

  end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
