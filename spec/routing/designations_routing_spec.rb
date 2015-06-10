require 'spec_helper'

describe "Designation routes" do
  it "should route 'designations' to the index of designations" do
    {:get => designations_path}.should route_to(:controller => "designations", :action => "index")
  end
  
  it "should route 'new_designations_path' to the new action of the designations" do
    {:get => new_designation_path}.should route_to(:controller => "designations", :action => "new")
  end

  it "should route 'designation_path(1)' to the show action of the designations controller" do
    {:get => designation_path(1)}.should route_to(:controller => "designations", :action => "show", :id => '1')
  end
  
  it "should route 'edit_designation_path(1)' to the edit action of the designations controller" do
    {:get => edit_designation_path(1)}.should route_to(:controller => "designations", :action => "edit", :id => '1')
  end
  
  it "should route 'designations_path' to create of the designations controller when passed a html verb of post" do
    {:post => designations_path}.should route_to(:controller => "designations", :action => "create")
  end
  
  it "should route 'designation_path(1)' to update action of the designations controller when passed a html verb of put" do
    {:put => designation_path(1)}.should route_to(:controller => "designations", :action => "update", :id => '1')
  end
  
  it "should route 'designation_path(1) to destroy action of the designations controller when passed a html verb of delete'" do
    {:delete => designation_path(1)}.should route_to(:controller => "designations", :action => "destroy", :id => '1')
  end
end