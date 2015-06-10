require 'spec_helper'

describe "leave_policies/new.html.erb" do
  it "renders a new form to create a new leave policy" do
    assign(:leave_policy, mock_model("LeavePolicy").as_new_record.as_null_object)
    render
    rendered.should have_selector("form",
    :method => "post",
    :action => leave_policies_path) do |form|
      form.should have_selector("input",
      :type => "text",
      :name => "leave_policy[policy_type]")
      form.should have_selector("input",
      :type => "text",
      :name => "leave_policy[no_of_days]")
      form.should have_selector("input",
      :type => "submit")
    end
  end
end