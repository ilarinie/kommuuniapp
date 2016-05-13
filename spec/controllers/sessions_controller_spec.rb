require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'should render login' do
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe 'POST #create' do
    before :each do
      request.env["HTTP_REFERER"] = root_url
    end
    it 'should create new session with correct user info' do
      user = FactoryGirl.create(:user)
      post :create, username:user.username, password:'12345678'
      expect(session[:user_id]).to eq(user.id)
    end
    it 'should not create new session with incorrect info' do
      user = FactoryGirl.create(:user)
      post :create, username:user.username, password:'1234568'
      expect(response).to redirect_to(:back)
    end
  end
  describe 'POST #destroy' do
    it 'should remove session' do
      user = FactoryGirl.create(:user)
      post :create, username:user.username, password:'12345678'
      expect(session[:user_id]).to eq(user.id)
      post :destroy
      expect(session[:user_id]).to eq(nil)
      expect(response).to redirect_to(signin_path)
    end
  end




end
