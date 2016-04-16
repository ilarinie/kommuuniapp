class UsersController < ApplicationController
  before_action :ensure_that_signed_in
  before_action :set_user, only: [:show]

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
