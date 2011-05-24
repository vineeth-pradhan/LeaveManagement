require 'spec_helper'

describe "site/site.html.erb" do
  before do    
    assign(:employee, stub_model(Employee,
    :id => 1,
    :full_name => "Admin User"))
  end
  
  it "displays a welcome message" do
    render
    rendered.should contain("Welcome, Admin User")
  end
  
  it "has a link to Available leaves" do
    render
    rendered.should have_selector("a",
    :href => employee_available_offs_path(1))
  end
  
  it "has a link to apply for new leaves" do
    render
    rendered.should have_selector("a",
    :href => new_employee_applied_off_path(1))
  end
  
  context "the current_employee is a leave approving manager" do
   it "should display Applied leaves" do
     assign(:employee, stub_model(Employee, :approving_manager => true))
     assign(:applied_offs, [])
     render 
     rendered.should contain("Applied leaves:") 
   end
  end
  
  context "the current_employee is not a leave approving manager" do
    it "should not displays applied leaves" do
      assign(:employee, stub_model(Employee, :approving_manager => false))
      render
      rendered.should_not contain("Applied leaves:")
    end  
  end
end