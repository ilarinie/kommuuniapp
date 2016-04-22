require 'rails_helper'

RSpec.describe ChoresController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      get :index
      expect(response).to render_template("index")
    end
  end
  describe "POST #create" do
    context 'with valid attributes' do
      it 'creates chore' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        post :create, chore: FactoryGirl.attributes_for(:chore)
        expect(Chore.count).to eq(1)
      end
    end
  end


end
