require 'spec_helper'

describe "LeavePolicy routes" do
  it "should route 'leave_policies' to the index of leave_policies" do
    {:get => leave_policies_path}.should route_to(:controller => "leave_policies", :action => "index")
  end
  
  it "should route 'new_leave_policies_path' to the new action of the leave_policies" do
    {:get => new_leave_policy_path}.should route_to(:controller => "leave_policies", :action => "new")
  end

  it "should route 'leave_policy_path(1)' to the show action of the leave_policies controller" do
    {:get => leave_policy_path(1)}.should route_to(:controller => "leave_policies", :action => "show", :id => '1')
  end
  
  it "should route 'edit_leave_policy_path(1)' to the edit action of the leave_policies controller" do
    {:get => edit_leave_policy_path(1)}.should route_to(:controller => "leave_policies", :action => "edit", :id => '1')
  end
  
  it "should route 'leave_policies_path' to create of the leave_policies controller when passed a html verb of post" do
    {:post => leave_policies_path}.should route_to(:controller => "leave_policies", :action => "create")
  end
  
  it "should route 'leave_policy_path(1)' to update action of the leave_policies controller when passed a html verb of put" do
    {:put => leave_policy_path(1)}.should route_to(:controller => "leave_policies", :action => "update", :id => '1')
  end
  
  it "should route 'leave_policy_path(1) to destroy action of the leave_policies controller when passed a html verb of delete'" do
    {:delete => leave_policy_path(1)}.should route_to(:controller => "leave_policies", :action => "destroy", :id => '1')
  end
end