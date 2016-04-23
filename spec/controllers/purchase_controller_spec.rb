require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  describe "GET #index" do
    context 'when user signed in' do
    before :each do
      user = FactoryGirl.create(:user)
      session[:user_id] = 1
    end
    it 'to return correct template' do

    cat = FactoryGirl.create(:purchase_category)
    purchase = FactoryGirl.create(:purchase, purchase_category_id:cat.id)
    get :index
    expect(response).to render_template(:index)
  end
  end
  end


end
