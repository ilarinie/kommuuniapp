require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET methods" do
  before :each do
    @user = FactoryGirl.create(:user, admin:true,deactivated:false)
    session[:user_id] = @user.id
    request.env["HTTP_REFERER"] = root_url
  end

  it 'should render user page' do
    get :show, id:@user.id
    expect(response).to render_template(:show)
  end

  it 'should render manage page for admin' do
    get :manage
    expect(response).to render_template(:manage)
  end

end
  describe "UPDATE methods" do
    before :each do
      request.env["HTTP_REFERER"] = root_url
    end

  it 'if admin should be able to deactivate users' do
    u = FactoryGirl.create(:user, admin:true)
    session[:user_id] = u.id
    user2 = FactoryGirl.create(:user, deactivated:false)
    delete :destroy, id:user2.id
    expect(user2.deactivated).to eq(false)
  end

  it 'if admin should be able to activate users' do
    u = FactoryGirl.create(:user, admin:true)
    session[:user_id] = u.id
    user2 = FactoryGirl.create(:user, deactivated:true)
    post :activate, id:user2.id
    expect(user2.deactivated).to eq(true)
  end

  it 'if admin should be able to create user' do
    u = FactoryGirl.create(:user, admin:true)
    session[:user_id] = u.id
    expect do
    post :create, user: FactoryGirl.attributes_for(:user)
  end.to change {User.count}.by(1)
end

  it 'should be able to edit information' do
    u = FactoryGirl.create(:user, admin:true)
    session[:user_id] = u.id
    put :update, id:u.id, user: FactoryGirl.attributes_for(:user, name:"test2")
    expect(User.find(u.id).name).to eq("test2")
  end
  it 'should be able to edit own information if not admin ' do
    u = FactoryGirl.create(:user)
    session[:user_id] = u.id
    put :update, id:u.id, user: FactoryGirl.attributes_for(:user, name:"test2")
    expect(User.find(u.id).name).to eq("test2")
  end

end
end
