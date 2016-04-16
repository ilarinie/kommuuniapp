class ChoreUsersController < ApplicationController
  before_action :ensure_that_signed_in

  def add_to_user
    choreuser = ChoreUser.where(user_id:current_user.id, chore_id:params["format"])
    if choreuser.empty?
      current_user.chores << Chore.find(params["format"])
      redirect_to :back
    end
  end

  def remove_from_user
    choreuser = ChoreUser.where(user_id:current_user.id, chore_id:params["format"])
    if choreuser.empty?
      redirect_to :back
    else
      choreuser.first.destroy
      redirect_to :back
    end
  end

end
