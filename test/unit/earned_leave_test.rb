# == Schema Info
# Schema version: 20101207054735
#
# Table name: leaves
#
#  id                :integer(4)      not null, primary key
#  employee_id       :integer(4)      not null, default(0)
#  casual_leaves     :integer(4)      not null, default(0)
#  earned_leaves     :integer(4)      not null, default(0)
#  leave_type        :string(50)      not null, default("")
#  privileged_leaves :integer(4)      not null, default(0)
#  sick_leaves       :integer(4)      not null, default(0)
#  year              :integer(4)      not null, default(0)
#  created_at        :datetime
#  updated_at        :datetime

require 'test_helper'

class EarnedLeaveTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end