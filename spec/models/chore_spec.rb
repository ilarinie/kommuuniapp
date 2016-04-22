require 'rails_helper'

RSpec.describe Chore, type: :model do
  it "has name, priority and reward set correctly and saved" do
    chore = Chore.create name:"Testichore", priority:1, reward:1

    chore.name.should == "Testichore"
    chore.priority.should == 1
    chore.reward.should == 1
    chore.valid?.should == true
    chore.to_s.should == "Testichore"
  end
end
