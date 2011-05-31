require 'spec_helper'

describe RestrictedHoliday do
  context "validation" do
    before(:each) do
     @rh=RestrictedHoliday.create!(
       :rdate => '2008-10-02',
       :occasion => "Gandhi Jayanthi")
    end
    it "is invalid if the rdate is not present" do
      @rh.rdate=nil
      @rh.should_not be_valid
    end
    it "is invalid if the ocassion is not present" do
      @rh.occasion=nil
      @rh.should_not be_valid
    end
    it "is invalid if the occassion is already existing in the table" do
      rh=stub_model(RestrictedHoliday,
      :rdate => '2008-10-10',
      :occasion => "Gandhi Jayanthi")
      expect{rh.save!}.to raise_exception
    end
    it "is invalid if the rdate is already existing in the table" do
      rh=stub_model(RestrictedHoliday,
      :rdate => '2008-10-02',
      :occasion => "Independence day")
      expect{rh.save!}.to raise_exception
    end
    it "is valid if both rdate and the occasion are valid" do
      rh=stub_model(RestrictedHoliday,
      :rdate => '2008-08-15',
      :occasion => "Independence day")
      expect{rh.save!}.to_not raise_exception
    end
  end
end