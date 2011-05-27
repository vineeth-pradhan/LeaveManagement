require 'spec_helper'
include LoadInitialData

describe AppliedOff do
  
  
    context "validates_presence_of" do
      before(:each) do      
        LoadInitialData.load_all_designations
        LoadInitialData.load_essential_employees
        LoadInitialData.load_leave_policies
        LoadInitialData.load_day_offs
        @employee=Employee.first
        @available_off=@employee.available_offs.first
        @applied_off = stub_model(AppliedOff,
        :id => 1,
        :employee => @employee,
        :available_off => @available_off,
        :status => "pending",
        :from_date => Time.now,
        :to_date => Time.now+1.day)
      end
      # validate the applied_off object
      it "is valid" do
        @applied_off.should be_valid
      end
      
      # validate_presence_of
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
    end
   
   
   
   
    context "Business logic validation" do
      before(:each) do
        LoadInitialData.load_all_designations
        LoadInitialData.load_essential_employees
        LoadInitialData.load_leave_policies
        LoadInitialData.load_day_offs
        @employee=Employee.first
        @available_off=@employee.available_offs.first
        @applied_off = stub_model(AppliedOff,
        :id => 1,
        :employee => @employee,
        :available_off => @available_off,
        :status => "pending",
        :from_date => Time.now,
        :to_date => Time.now+1.day)
      end
      
      # validate from_date_not_to_be_greater_than_to_date
      it "is not valid when from_date value is greater than to_date value" do
        @applied_off.from_date = Time.now + 1.day.from_now
        @applied_off.to_date = Time.now
        @applied_off.should_not be_valid
      end
      
      # When from_date and to_date are the same, it should be valid
      it "is valid when both the from_date and to_date are the same" do
        @applied_off.from_date = Time.now
        @applied_off.to_date = @applied_off.from_date
        @applied_off.should be_valid
      end
      
      # Check if the method get_days_in_number is working correctly
      it "returns appropriate number of days of leave applied when to_date is subtracted from  from_date" do
        @applied_off.from_date = Time.now
        @applied_off.to_date = @applied_off.from_date
        @applied_off.no_of_days.should  eq(1)
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