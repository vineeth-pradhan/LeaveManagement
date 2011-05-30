require 'spec_helper'

describe AppliedOff do
  context "AppliedOff" do
# only @applied_off object is a stub and the rest of the objects used have real database attributes
    before(:each) do
      LoadInitialData.load_all_designations
      LoadInitialData.load_essential_employees
      LoadInitialData.load_leave_policies
      LoadInitialData.load_day_offs
    end
    
    
    context "validates_presence_of" do
      before(:each) do
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
   
   
   
   
   
    context "Business logic" do
# Refactoring before(:each) wont help. Cuz the validation for from_date will be set to nil in the prev test,
# and the rest of the validation fails and hence this context will fail too,
# probably a TODO: Try to figure out how to refactor this. 
      before(:each) do
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
         @applied_off.stub(:from_date).and_return(Time.now + 1.day)
         @applied_off.stub(:to_date).and_return(Time.now)
         @applied_off.from_date_not_to_be_greater_than_to_date.should include("From date cannot be greater than to date")
      end
      
      # When from_date and to_date are the same, it should be valid
      it "is valid when both the from_date and to_date are the same" do
        @applied_off.from_date = Time.now
        @applied_off.to_date = @applied_off.from_date
        @applied_off.should be_valid
      end
      
      # validate the method check_no_of_leaves
      it "is not valid when the no of days of leave applied is greater than the available leaves for an employee" do
        @applied_off.stub(:no_of_days).and_return 1
        @applied_off.available_off.stub(:no_of_days).and_return 0
        @applied_off.check_no_of_leaves.should == false
      end
            
      # Check if the method get_days_in_number is working correctly
      it "returns appropriate number of days of leave applied when to_date is subtracted from  from_date" do
        @applied_off.from_date = Time.now
        @applied_off.to_date = @applied_off.from_date
        @applied_off.no_of_days.should  eq(1)
      end
      
      # Check if the rejection of leaves works appropriately
      it "rejects leaves appropriately" do
        expect{@applied_off.reject}.to change(@applied_off, :status).from("pending").to("rejected")
        expect{@applied_off.reject}.to change(@applied_off.available_off, :no_of_days).by(2)
      end
      # Check if the approval of leaves works appropriately
      it "approves leaves appropriately" do
        expect{@applied_off.approve}.to change(@applied_off, :status).from("pending").to("approved")
      end
    end
    
    
    
    
    
    context "Fetching available leaves" do
      let(:employee){Employee.first}
    
      it "is not empty" do
        @applied_off=AppliedOff.new
        @applied_off.fetch_available_leaves(employee).should_not be_empty      
      end
    
      it "includes 'Earned', 'Restricted', 'Sick/casual' leave when the method 'fetch_available_leaves' is called" do
        @applied_off=AppliedOff.new
        @applied_off.fetch_available_leaves(employee).should include(["EARNED", 2], ["RESTRICTED", 3], ["SICK/CASUAL", 1])
      end
      
      it "does not include the maternity leave if the employee is a male" do
        @applied_off=AppliedOff.new
        employee.stub(:gender).and_return "M"
        @applied_off.fetch_available_leaves(employee).should_not include(["MATERNITY", 3])
      end
    end
  end
end