# == Schema Info
# Schema version: 20101207054735
#
# Table name: rejected_leaves
#
#  id          :integer(4)      not null, primary key
#  employee_id :integer(4)      not null, default(0)
#  leave_id    :integer(4)      not null, default(0)
#  created_at  :datetime
#  updated_at  :datetime

class RejectedLeave < ActiveRecord::Base
end