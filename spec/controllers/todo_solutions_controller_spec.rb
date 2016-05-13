require 'rails_helper'

RSpec.describe TodoSolutionsController, type: :controller do
  describe 'POST #create' do
    before :each do
      request.env["HTTP_REFERER"] = root_url
    end
    context 'with valid attributes' do
      it 'creates todo solution' do
        FactoryGirl.create(:user)
        session[:user_id] = 1
        todo = FactoryGirl.create(:todo)
        post :create, todo_solution: FactoryGirl.attributes_for(:todo_solution, todo_id:todo.id, user_id:1)
        expect(TodoSolution.count).to eq(1)
        expect(TodoSolution.first.to_s).to eq('Testaaja solved testtodo')
        expect(TodoSolution.first.url).to eq('todos/1')
      end
    end
  end
end
