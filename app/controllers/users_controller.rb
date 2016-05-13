class UsersController < ApplicationController
  before_action :ensure_that_signed_in
  before_action :ensure_that_admin, only: [:manage, :destroy, :create, :activate]
  before_action :set_user, only: [:show, :destroy, :update, :activate, :edit, :todos, :chores, :purchases]
  before_action :ensure_that_user, only: [:todos, :chores, :refunds]
  before_action :ensure_update_permission, only: [:update]

  def show

    if @user == current_user
      @todos = Todo.where(creator_id: @user.id).where(private: true).where(todo_solution_id: nil).paginate(page: params[:page]).order(:due)
      @comptodos = Todo.where(creator_id: @user.id).where(private: true).where.not(todo_solution_id: nil).paginate(page: params[:comppage]).order(:due)
    end
  end

  def todos
    @todos = Todo.where(creator_id: @user.id).where(private: true).where(todo_solution_id: nil).paginate(page: params[:page]).order(:due)
    @comptodos = Todo.where(creator_id: @user.id).where(private: true).where.not(todo_solution_id: nil).paginate(page: params[:comppage]).order(:due)
  end

  def chores
    @chores = Chore.where(private:true).where(creator_id:current_user.id)
  end

  def purchases
    @purchases = @user.purchases
    @categories = PurchaseCategory.all
    @users = User.active
  end

  def refunds
    @refunds = Refund.where(receiver_id: current_user.id).where(confirmed: false)
    @pendrefunds = Refund.where(payer_id: current_user.id).where(confirmed: false)
  end

  def manage
    @users = User.active
    @dusers = User.deactivated
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    startingbalance = Purchase.new(purchase_category_id: 1, price: average_purchase, description: 'Starting balance for added user')
    if @user.save
      startingbalance.user_id = @user.id
      @user.purchases << startingbalance
      redirect_to :back, notice: 'New user added.'
    else
      redirect_to :back, alert: 'Error creating new user'
    end
  end

  def destroy
    if @user.update(deactivated:true)
      redirect_to :back, notice: 'User deactivated successfully.'
    else
      redirect_to :back, alert: 'Error destroying user.'
    end
  end

  def update
    if @user.update(update_params)
      redirect_to :back, notice: 'User information updated successfully'
    else
      if @user == current_user
        render :edit
      else
        render :manage, alert: 'Something went wrong'
      end
    end
  end

  def activate
    if @user.update(deactivated: false)
      redirect_to :back, notice: 'User activated.'
    else
      redirect_to :back, alert: 'Something went wrong'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation, :admin)
  end

  def update_params
    if current_user.admin?
      params.require(:user).permit(:name, :password, :password_confirmation, :admin)
    else
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
  end

  def ensure_that_user
    redirect_to :root, notice: 'Not your list!' if not current_user == @user
  end

  def ensure_update_permission
    current_user == @user || current_user.admin?
  end
end
