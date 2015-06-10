require 'spec_helper'

describe LeavePolicy do
  context "Leave Policy" do
    before do
      @leave_policy=LeavePolicy.new(:policy_type => "Paternity Leave", :no_of_days => 1)
    end
    it "is valid with valid attributes" do
      @leave_policy.should be_valid
    end
    it "is not valid without a policy type" do
      @leave_policy.policy_type=nil
      @leave_policy.should_not be_valid
    end
    it "is not valid without no of days" do
      @leave_policy.no_of_days=nil
      @leave_policy.should_not be_valid
    end  
  end
  
  context "After adding a new leave policy" do
    pending
  end
end