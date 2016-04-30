class XpsController < ApplicationController

  def index
    @users = User.active.sort_by{ |u| u.xp_total}.reverse
    @weeklyusers =  User.active.sort_by{ |u| u.xp_total_range Date.today.beginning_of_week }.reverse
    @monthlyusers =  User.active.sort_by{ |u| u.xp_total_range Date.today.beginning_of_month }.reverse
  end

end
