require 'spec_helper'
describe "leave_policies/new.html.erb" do
  it "renders a  form to create a new leave policy" do
    assign(:leave_policy, double("LeavePolicy"))
    render
    rendered.should have_selector("form",
    :method => "post",
    :action => leave_policy_path) do |form|
      form.should have_selector("input", :type => "submit")
    end
  end
end