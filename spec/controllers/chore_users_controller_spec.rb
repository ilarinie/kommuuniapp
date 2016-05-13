require 'rails_helper'

RSpec.describe ChoreUsersController, type: :controller do
  before :each do
    request.env["HTTP_REFERER"] = root_url
  end
  describe 'POST #add_to_user' do
    it 'adds given chore to current user' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      chore = FactoryGirl.create(:chore)
      post :add_to_user, format:chore.id
      expect(ChoreUser.count).to eq(1)
    end
  end
  describe 'POST #remove_from_user' do
    it 'removes given chore from current user' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      chore = FactoryGirl.create(:chore)
      post :add_to_user, format:chore.id
      expect(ChoreUser.count).to eq(1)
      post :remove_from_user, format:chore.id
        expect(ChoreUser.count).to eq(0)
    end
  end

end
