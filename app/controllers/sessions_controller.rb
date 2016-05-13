class SessionsController < ApplicationController
  def new
    # renderöi kirjautumissivun
  end

  def create
    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password]) && !user.deactivated?
      session[:user_id] = user.id
      redirect_to :root, notice: 'Welcome back!'
    else
      redirect_to :back, notice: 'Username and/or password mismatch'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path
  end
end
