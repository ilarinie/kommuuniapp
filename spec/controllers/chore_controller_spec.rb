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
    context 'with invalid attributes' do
      it 'doesnt create chore' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        post :create, chore: FactoryGirl.attributes_for(:chore, name:nil)
        expect(Chore.count).to eq(0)
      end
    end
  end
  describe "PUT #update" do
    context 'with valid attributes' do
      it 'updates chore' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        chore = FactoryGirl.create(:chore)
        put :update, id:chore.id, chore: FactoryGirl.attributes_for(:chore, name:"test2")
        expect(Chore.first.name).to eq("test2")
      end
    end
    context 'with invalid attributes' do
      it 'does not update chore' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        chore = FactoryGirl.create(:chore)
        put :update, id:chore.id, chore: FactoryGirl.attributes_for(:chore, name:nil)
        expect(Chore.first.name).to eq("testchore")
      end
    end
  end
  describe "POST #complete" do
    it 'should create appropriate task' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      chore = FactoryGirl.create(:chore)
      post :complete, format:chore.id
      expect(Task.count).to eq(1)
    end
  end
  describe "POST #publish" do
    it 'should make the chore public' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      chore = FactoryGirl.create(:chore, private:true, creator_id:1)
      post :publish, format:chore.id
      expect(Chore.first.private).to eq(false)
    end
    it 'should not make the chore public if current_user not the creator' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      chore = FactoryGirl.create(:chore, private:true, creator_id:2)
      post :publish, format:chore.id
      expect(Chore.first.private).to eq(true)
    end
  end
  describe "GET #show" do
    it 'should render view if public chore' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      chore = FactoryGirl.create(:chore)
      get :show, id:chore.id
      expect(response).to render_template(:show)
    end
    it 'should render view if owned private chore' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      chore = FactoryGirl.create(:chore,private:true, creator_id:1)
      get :show, id:chore.id
      expect(response).to render_template(:show)
    end
    it 'should not render view if not owned private chore' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      chore = FactoryGirl.create(:chore,private:true, creator_id:2)
      get :show, id:chore.id
      expect(response).to redirect_to(:root)
    end
    it 'should order users accordingly' do
      u1 = FactoryGirl.create(:user)
      u2 = FactoryGirl.create(:user, username:"test2")
      session[:user_id] = 2
      chore = FactoryGirl.create(:chore)
      post :complete, format:chore.id
      get :show, id:chore.id
      expect(controller.sort_users_by_task_count.first).to eq([2, 1])
    end
  end
  describe "DELETE #delete" do
    it 'should delete owned chore' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      chore = FactoryGirl.create(:chore,private:true, creator_id:1)
      delete :destroy, id:chore.id
      expect(Chore.count).to eq(0)
    end
    it 'should delete anyones public chore' do
      FactoryGirl.create(:user)
      session[:user_id] = 1
      chore = FactoryGirl.create(:chore,private:false, creator_id:2)
      delete :destroy, id:chore.id
      expect(Chore.count).to eq(0)
    end

  end


end
