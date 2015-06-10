require 'spec_helper'

describe LeavePoliciesController do
  describe "POST create" do
    
    let(:leave_policy) {mock_model(LeavePolicy).as_null_object}
    before do
      LeavePolicy.stub(:new).and_return(leave_policy)
    end
    
    it "creates a new message" do
      LeavePolicy.should_receive(:new).with("policy_type" => "paternity").and_return(leave_policy)
      post :create, :leave_policy => {"policy_type" => "paternity"}
    end
    
    
    context "when the message saves successfully" do
      before do
        leave_policy.stub(:save).and_return(true)
      end
      
      it "sets a flash message" do
        post :create
        flash[:notice].should eq("The new Leave Policy was saved successfully.")
      end
      it "should re-direct to index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end
    
    
    context "when the message fails to save" do
      before do
        leave_policy.stub(:save).and_return(false)
      end
      
      it "assigns @leave_policy" do
        post :create
        assigns[:leave_policy].should eq(leave_policy)
      end
      it "renders the new template" do
        post :create
        response.should render_template("new")
      end
    end
  end
end
