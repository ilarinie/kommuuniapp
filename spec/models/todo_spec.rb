require 'rails_helper'
RSpec.describe Todo, type: :model do
  it "has name, priority and reward set correctly and saved" do
    todo = FactoryGirl.create(:todo)
    user = FactoryGirl.create(:user)
    todouser = TodoUser.create(user:user, todo:todo)
    todo.title.should == "testtodo"
    todo.description.should == "desc"
    todo.valid?.should == true
  end
end
