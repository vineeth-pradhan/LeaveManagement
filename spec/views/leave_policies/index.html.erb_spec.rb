require 'spec_helper'

describe "leave_policies/index.html.erb" do
  before(:each) do
    assign(:leave_policies, [
    stub_model(LeavePolicy, :id => 1, :policy_type => "Casual Leave"),
    stub_model(LeavePolicy, :id => 2, :policy_type => "Earned Leave"),
    stub_model(LeavePolicy, :id => 3, :policy_type => "Sick Leave")
    ])
    render
  end
  
  
  it "displays all leave policies" do
    rendered.should contain("Casual Leave")
    rendered.should contain("Earned Leave")
    rendered.should contain("Sick Leave")
  end
  
  it "displays edit link for each leaves" do
    rendered.should have_selector("a",
    :href => edit_leave_policy_path(1))
    rendered.should have_selector("a",
    :href => edit_leave_policy_path(2))
    rendered.should have_selector("a",
    :href => edit_leave_policy_path(3))
    
    rendered.should_not have_selector("a",
    :href => edit_leave_policy_path(4))
  end
  
  it "displays destroy links to each leave types" do
    rendered.should have_selector("a",
    :href => leave_policy_path(1),
    "data-method" => "delete")
    rendered.should have_selector("a",
    :href => leave_policy_path(2),
    "data-method" => "delete")
    rendered.should have_selector("a",
    :href => leave_policy_path(3),
    "data-method" => "delete")
  end
end