require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'should save with valid attributes and category' do
    user = FactoryGirl.create(:user)
    ps = FactoryGirl.create(:purchase, user_id:user.id)
    pc = PurchaseCategory.create(name:"testcat")
    pc.purchases << ps
    expect(pc.to_s).to eq("testcat")
    ps.valid?.should == true
    pc.valid?.should == true
    expect(ps.to_s).to eq("Testaaja bought testpurchase. Cost: 10.00")
    expect(ps.url).to eq("purchases")

  end
end
