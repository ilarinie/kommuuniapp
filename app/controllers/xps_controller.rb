class XpsController < ApplicationController

  def index
    @users = User.all
  end

end
