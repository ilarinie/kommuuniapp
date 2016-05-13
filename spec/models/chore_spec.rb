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
  it 'should be possible to complete' do
    user = FactoryGirl.create(:user)
    chore = FactoryGirl.create(:chore)
    chore.complete user
    expect(Task.count).to eq(1)
    expect(Task.first.to_s).to eq('Testaaja finished testchore')
    expect(Task.first.url).to eq('chores/1')

  end
  it 'should calculate priority correctly' do
    chore = FactoryGirl.create(:chore)
    chore.prioritycalc("hours")
    expect(chore.priority).to eq(1)
    chore.prioritycalc("days")
    expect(chore.priority).to eq(24)
    chore.priority = 1
    chore.prioritycalc "weeks"
    expect(chore.priority).to eq(168)
  end
end
