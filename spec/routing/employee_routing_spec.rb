require 'spec_helper'

describe "Employee routes" do
  it "should route 'new_employees_path' to the new action of the employees" do
    {:get => new_employee_path}.should route_to(:controller => "employees", :action => "new")
  end
  
  it "should route 'employees_path' to create of the employees controller when passed a html verb of post" do
    {:post => employees_path}.should route_to(:controller => "employees", :action => "create")
  end
end