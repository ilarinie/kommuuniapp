require 'rails_helper'

RSpec.describe IndexController, type: :controller do
  it 'should render index when user logged in' do
    FactoryGirl.create(:user)
    session[:user_id] = 1
    get :index
    expect(response).to render_template(:index)
  end



end
