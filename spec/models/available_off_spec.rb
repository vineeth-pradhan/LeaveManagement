require 'spec_helper'

describe AvailableOff do
  context "update the leaves after rejection by the manager" do    
    it "should deduct leaves by 3 when 'deduct_leaves(3)' is called" do
      @available_off = stub_model(AvailableOff,
      :id => 1,
      :no_of_days => 5.0)
      @available_off.deduct_leaves(3)
      @available_off.no_of_days.should == 2.0
    end
  end
end