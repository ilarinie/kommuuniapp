require 'rails_helper'

RSpec.describe Refund, type: :model do
  it 'should save with correct values' do
    FactoryGirl.create(:user)
    FactoryGirl.create(:user)
    refund = Refund.create(amount:10,payer_id:1,receiver_id:2)
    refund.valid?.should == true

    end

end
