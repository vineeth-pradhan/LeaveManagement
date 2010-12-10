# == Schema Info
# Schema version: 20101207054735
#
# Table name: approved_leaves
#
#  id          :integer(4)      not null, primary key
#  employee_id :integer(4)      not null, default(0)
#  leave_id    :integer(4)      not null, default(0)
#  created_at  :datetime
#  updated_at  :datetime

class ApprovedLeave < ActiveRecord::Base
end