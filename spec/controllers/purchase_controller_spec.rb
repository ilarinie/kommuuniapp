require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  describe 'GET #index' do
    context 'when user signed in' do
      before :each do
        user = FactoryGirl.create(:user)
        session[:user_id] = 1
      end
      it 'to return correct template' do
        cat = FactoryGirl.create(:purchase_category)
        purchase = FactoryGirl.create(:purchase, purchase_category_id: cat.id)
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
  describe 'GET #new' do
    it 'renders view if signed in' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe "POST #create" do
    context 'with valid attributes' do
      it 'creates purchase' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        post :create, purchase: FactoryGirl.attributes_for(:purchase)
        expect(Purchase.count).to eq(1)
      end
    end
    context 'with invalid attributes' do
      it 'doesnt create chore' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        post :create, purchase: FactoryGirl.attributes_for(:purchase, price:-1)
        expect(Purchase.count).to eq(0)
      end
    end
  end

end
