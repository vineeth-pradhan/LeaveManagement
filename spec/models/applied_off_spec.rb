require 'spec_helper'
require 'rake'

describe AppliedOff do
  context "Leave Policy" do
    let(:employee){Employee.first}
    it "is not empty" do
      @applied_offs=AppliedOff.new
      @applied_offs.fetch_available_leaves(employee).should_not be_empty
    end
    
    context "Retrieve leave policies" do
      it "fetches all the leave policies" do
        @applied_offs = AppliedOff.new
        @applied_offs.fetch_available_leaves(employee).should include("Sick")
      end
    end
  end
end