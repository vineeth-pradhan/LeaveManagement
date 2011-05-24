require 'spec_helper'

describe "leave_policies/show.html.erb" do
  it "displays the description" do
    assign(:leave_policy, stub_model(LeavePolicy, :description => "Paternity Leave is only for employees those who are married and have kids"))
    
    render
    rendered.should contain("Paternity Leave is only for employees those who are married and have kids")
  end
end