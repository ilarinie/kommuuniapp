require 'rails_helper'

RSpec.describe IndexController, type: :controller do
  it 'should render index when user logged in' do
    FactoryGirl.create(:user)
    session[:user_id] = 1
    get :index
    expect(response).to render_template(:index)
  end
  it 'should render feed when user logged in' do
    FactoryGirl.create(:user)
    session[:user_id] = 1
    get :feed
    expect(response).to render_template(:feed)
  end



end
