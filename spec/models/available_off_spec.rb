require 'spec_helper'

describe AvailableOff do
  context "update the leaves after rejection by the manager" do
    it "should change by the appropriate no_of_days that is sent in the parameter" do      
      @available_off = stub_model(AvailableOff, 
      :id => 1, 
      :no_of_days => 1.0)
      @available_off.restore_leaves(2)
      @available_off.no_of_days.should == 3.0
    end
  end
end