require 'rails_helper'

RSpec.describe TodoCategoriesController, type: :controller do
  describe "GET #new" do
    it 'should render view if signed in' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe 'GET #show' do
    it 'should render view if signed in' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      todo_category = FactoryGirl.create(:todo_category)
      get :show, id:todo_category.id
      expect(response).to render_template(:show)
    end
  end
  describe "POST #create" do
    context 'with valid attributes' do
      it 'creates purchase category' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        post :create, todo_category: FactoryGirl.attributes_for(:todo_category)
        expect(TodoCategory.count).to eq(1)
      end
    end
    context 'with invalid attributes' do
      it 'doesnt create purchase category' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        post :create, todo_category: FactoryGirl.attributes_for(:todo_category, name:nil)
        expect(TodoCategory.count).to eq(0)
      end
    end
  end



end
