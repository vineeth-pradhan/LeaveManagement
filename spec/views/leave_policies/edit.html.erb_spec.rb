require 'spec_helper'

describe "leave_policies/edit.html.erb" do
  before(:each) do
    @leave_policy = mock_model("LeavePolicy",
    :id => 1,
    :policy_type => "Casual Leave",
    :no_of_days  => 12).as_null_object
    assign(:leave_policy, @leave_policy)
  end
  
  it "renders a pre-populated form to edit a leave policy" do
    render
    rendered.should have_selector("form", 
    :method => "post",
    :action => leave_policy_path(@leave_policy)) do |form|
      form.should have_selector("input",
      :type => "text",
      :name => "leave_policy[policy_type]",
      :value => "Casual Leave")
      
      form.should have_selector("input",
      :type => "text",
      :name => "leave_policy[no_of_days]",
      :value => '12')
      
      form.should have_selector("input",
      :type => "submit")
    end
  end
end  