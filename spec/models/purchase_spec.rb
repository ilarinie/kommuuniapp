require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'should save with valid attributes and category' do
    ps = FactoryGirl.create(:purchase)
    pc = PurchaseCategory.create(name:"testcat")
    pc.purchases << ps
    expect(pc.to_s).to eq("testcat")
    ps.valid?.should == true
    pc.valid?.should == true

  end
end
