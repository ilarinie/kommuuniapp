require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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

  it 'if admin should be able to deactivate users' do
    user2 = FactoryGirl.create(:user, deactivated:true)
    delete :destroy, id:user2.id
    expect(user2.deactivated).to eq(true)
  end


end
