require 'spec_helper'

describe "AppliedOff routes" do
  it "should route 'applied_offs' to the index of applied_offs" do
    {:get => employee_applied_offs_path(1)}.should route_to(:controller => "applied_offs", :action => "index", :employee_id => '1')
  end
  
  it "should route 'new_applied_offs_path' to the new action of the applied_offs" do
    {:get => new_employee_applied_off_path(1)}.should route_to(:controller => "applied_offs", :action => "new", :employee_id => '1')
  end

  it "should route 'applied_offs_path(1)' to the show action of the applied_offs controller" do
    {:get => employee_applied_off_path(1,2)}.should route_to(:controller => "applied_offs", :action => "show", :id => '2', :employee_id => '1')
  end
  
  it "should route 'edit_applied_offs_path(1)' to the edit action of the applied_offs controller" do
    {:get => edit_employee_applied_off_path(1,2)}.should route_to(:controller => "applied_offs", :action => "edit", :id => '2', :employee_id => '1')
  end
  
  it "should route 'applied_offs_path' to create of the applied_offs controller when passed a html verb of post" do
    {:post => employee_applied_offs_path(1)}.should route_to(:controller => "applied_offs", :action => "create", :employee_id => '1')
  end
  
  it "should route 'applied_off_path(1)' to update action of the applied_offs controller when passed a html verb of put" do
    {:put => employee_applied_off_path(1,2)}.should route_to(:controller => "applied_offs", :action => "update", :id => '2', :employee_id => '1')
  end
  
  it "should route 'applied_off_path(1) to destroy action of the applied_offs controller when passed a html verb of delete'" do
    {:delete => employee_applied_off_path(1,2)}.should route_to(:controller => "applied_offs", :action => "destroy", :id => '2', :employee_id => '1')
  end
end