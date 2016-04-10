class IndexController < ApplicationController
  before_action :ensure_that_signed_in

  def index
    @chores = current_user.chores
  end
end
