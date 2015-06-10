require 'spec_helper'

describe "Root Routing" do
  it "routes to site#site controller action" do
    {:get => "/"}.should route_to(:controller => "site", :action => "site")
  end
end