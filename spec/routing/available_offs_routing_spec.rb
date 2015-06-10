require 'spec_helper'

describe "AvailableOff routes" do
  it "should route 'available_offs' to the index of available_offs" do
    {:get => employee_available_offs_path(1)}.should route_to(:controller => "available_offs", :action => "index", :employee_id => '1')
  end
  
  it "should route 'new_available_offs_path' to the new action of the available_offs" do
    {:get => new_employee_available_off_path(1)}.should route_to(:controller => "available_offs", :action => "new", :employee_id => '1')
  end

  it "should route 'available_offs_path(1)' to the show action of the available_offs controller" do
    {:get => employee_available_off_path(1,2)}.should route_to(:controller => "available_offs", :action => "show", :id => '2', :employee_id => '1')
  end
  
  it "should route 'edit_available_offs_path(1)' to the edit action of the available_offs controller" do
    {:get => edit_employee_available_off_path(1,2)}.should route_to(:controller => "available_offs", :action => "edit", :id => '2', :employee_id => '1')
  end
  
  it "should route 'available_offs_path' to create of the available_offs controller when passed a html verb of post" do
    {:post => employee_available_offs_path(1)}.should route_to(:controller => "available_offs", :action => "create", :employee_id => '1')
  end
  
  it "should route 'available_off_path(1)' to update action of the available_offs controller when passed a html verb of put" do
    {:put => employee_available_off_path(1,2)}.should route_to(:controller => "available_offs", :action => "update", :id => '2', :employee_id => '1')
  end
  
  it "should route 'available_off_path(1) to destroy action of the available_offs controller when passed a html verb of delete'" do
    {:delete => employee_available_off_path(1,2)}.should route_to(:controller => "available_offs", :action => "destroy", :id => '2', :employee_id => '1')
  end
end