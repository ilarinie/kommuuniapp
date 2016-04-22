require 'rails_helper'

describe "Purchase" do
  let!(:user) { FactoryGirl.create :user }
  let!(:purchase) { FactoryGirl.create :purchase}

  it " increases users purchase sum when created" do
    user.purchases << FactoryGirl.create(:purchase)
    user.purchase_sum.should == 10
  end




end
