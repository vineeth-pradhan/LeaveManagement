require 'spec_helper'

describe "leave_policies/show.html.erb" do
  it "displays the description" do
    assign(:leave_policy, stub_model(LeavePolicy,
    :policy_type => "Paternity Leave",
    :no_of_days  => 2,
    :description => "Paternity Leave is only for employees those who are married and have kids"))
    
    render
    rendered.should contain("Paternity Leave")
    rendered.should contain("2")
    rendered.should contain("Paternity Leave is only for employees those who are married and have kids")
  end
end