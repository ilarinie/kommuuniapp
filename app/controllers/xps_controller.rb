class XpsController < ApplicationController

  def index
    @users = User.all.sort_by{ |u| u.xp_total}.reverse
    @weeklyusers =  User.all.sort_by{ |u| u.xp_total_range Date.today.beginning_of_week }.reverse
    @monthlyusers =  User.all.sort_by{ |u| u.xp_total_range Date.today.beginning_of_month }.reverse
  end

end
