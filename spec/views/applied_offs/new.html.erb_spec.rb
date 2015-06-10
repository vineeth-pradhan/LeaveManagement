require 'spec_helper'

describe "applied_offs/new.html.erb" do
  it "renders the form" do
    assign(:current_employee, mock_model("Employee", :id => 1).as_null_object)
    assign(:applied_off, mock_model("AppliedOff", :id => 1).as_null_object)
    render
    rendered.should  have_selector("form") do |form|
      form.should have_selector("label",
      :for =>"applied_off_leave_type")
      form.should contain("Leave type")
      form.should have_selector("select",
      :name => "applied_off[available_off_id]")
    end
  end
end