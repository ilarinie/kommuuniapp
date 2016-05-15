class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :purchase_average, :average_purchase

  before_action :set_users

  def set_users
    @active_users = User.active
  end

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def ensure_that_signed_in
    redirect_to signin_path, notice: 'you should be signed in' if current_user.nil?
 end

 def ensure_that_admin
   redirect_to :root, alert: 'Trying to access admin-only resources.' if not current_user.admin?
 end

 def average_purchase
   summa = 0
   User.active.each do |user|
     summa += user.purchase_sum
   end
   summa/User.active.count
 end
end
