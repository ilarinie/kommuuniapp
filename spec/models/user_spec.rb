require 'rails_helper'

RSpec.describe User, type: :model do
  it "has name, username, password and saved to db" do
    u = User.create name:"test", username:"test", password:"testaaja", password_confirmation:"testaaja"

    u.name.should == "test"
    u.username.should == "test"
    u.valid?.should == true
    u.to_s.should == "test"
  end

  it "calculates purchase and xp totals correctly" do
    user = FactoryGirl.create(:user)
    user.xps << FactoryGirl.create(:xp)
    user.purchases << FactoryGirl.create(:purchase)

    user.xp_total.should == 10
    user.xp_total_range(1.days).should == 10
    user.purchase_sum.should == 10

    user.xps << FactoryGirl.create(:xp)
    user.purchases << FactoryGirl.create(:purchase)

    user.xp_total.should == 20
    user.xp_total_range(1.days).should == 20
    user.purchase_sum.should == 20

    end


  end
