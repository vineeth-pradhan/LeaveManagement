require 'spec_helper'
include LoadInitialData

describe AppliedOff do
  context "AppliedOff Validations" do
    before(:each) do
      @applied_off=stub_model(AppliedOff,
      :id => 1,
      :available_off_id => 1,
      :employee_id => 1,
      :status => "pending",
      :from_date => Time.now,
      :to_date => Time.now+1.day)
    end
    it "is not valid without available_off_id" do
      @applied_off.available_off_id = nil
      @applied_off.should_not be_valid
    end
    
    it "is not valid without employee_id" do
      @applied_off.employee_id = nil
      @applied_off.should_not be_valid
    end
    
    it "is not valid without status" do
      @applied_off.status = nil
      @applied_off.should_not be_valid
    end
    
    it "is not valid without from_date" do
      @applied_off.from_date = nil
      @applied_off.should_not be_valid
    end
    
    it "is valid when both the from_date and to_date are the same" do
      @applied_off.from_date = Time.now
      @applied_off.to_date = @applied_off.from_date
      @applied_off.should be_valid
    end
  end  
  
  context "Fetching available leaves" do
    before(:each) do
      LoadInitialData.load_all_designations
      LoadInitialData.load_essential_employees
      LoadInitialData.load_leave_policies
      LoadInitialData.load_day_offs
    end
    let(:employee){Employee.first}
    
    it "is not empty" do
      @applied_off=AppliedOff.new
      @applied_off.fetch_available_leaves(employee).should_not be_empty      
    end
    
    it "includes 'Earned', 'Restricted', 'Sick/casual', 'Maternity' leave when the method 'fetch_available_leaves' is called" do
      @applied_off=AppliedOff.new
      @applied_off.fetch_available_leaves(employee).should include("Earned", "Restricted", "Sick/casual", "Maternity")
    end    
  end
end