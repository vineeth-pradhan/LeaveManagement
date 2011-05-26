require 'spec_helper'

describe "Session routes" do
  it "should route 'new_session_path' to the new action of the session" do
    {:get => new_session_path}.should route_to(:controller => "sessions", :action => "new")
  end
  
  it "should route 'session_path' to create of the session controller when passed a html verb of post" do
    {:post => session_path}.should route_to(:controller => "sessions", :action => "create")
  end
  
  it "should route 'session_path to destroy action of the sessions controller when passed a html verb of delete'" do
    {:delete => session_path}.should route_to(:controller => "sessions", :action => "destroy")
  end
end