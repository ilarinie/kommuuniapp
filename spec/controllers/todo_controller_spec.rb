require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  before :each do
    request.env["HTTP_REFERER"] = root_url
  end
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
      it 'creates todo' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        post :create, todo: FactoryGirl.attributes_for(:todo)
        expect(Todo.count).to eq(1)
      end
    end
    context 'with invalid attributes' do
      it 'doesnt create chore' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        post :create, todo: FactoryGirl.attributes_for(:todo, title:nil)
        expect(Todo.count).to eq(0)
      end
    end
  end
  describe "GET #show" do
    it 'should render view if public todo' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      todo = FactoryGirl.create(:todo)
      get :show, id:todo.id
      expect(response).to render_template(:show)
    end
    it 'should not render view if private, not own todo' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      todo = FactoryGirl.create(:todo, private:true)
      get :show, id:todo.id
      expect(response).to redirect_to(:root)
    end
  end
  describe "GET #new" do
    it 'should render view if signed in' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      get :new
      expect(response).to render_template(:new)
    end
  end

end
