require 'rails_helper'

RSpec.describe RefundsController, type: :controller do
  describe "GET #new" do
    it 'renders new refund form' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it 'creates a new refund with valid attributes' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      expect do
      post :create, refund: FactoryGirl.attributes_for(:refund)
    end.to change{ Refund.count }.by(1)
    end
  end

  describe "POST #confirm" do
    it 'creates appropriate purchases' do
      request.env["HTTP_REFERER"] = root_url
      FactoryGirl.create(:user)
      FactoryGirl.create(:user)
      session[:user_id] = 1
      refund = FactoryGirl.create(:refund, payer_id:2, receiver_id:1)
      expect do
        post :confirm, format:refund.id
      end.to change{Purchase.count}.by(2)
    end
  end
  describe "POST #cancel" do
    it 'destroys the refund' do
      request.env["HTTP_REFERER"] = root_url
      FactoryGirl.create(:user)
      FactoryGirl.create(:user)
      session[:user_id] = 1
      refund = FactoryGirl.create(:refund, payer_id:2, receiver_id:1)
      expect(controller.refund_description(refund)).to eq("Refund from Testaaja to Testaaja amount: 10.0")
      expect do
        post :cancel, format:refund.id
      end.to change{Refund.count}.by(-1)
    end
  end






end
