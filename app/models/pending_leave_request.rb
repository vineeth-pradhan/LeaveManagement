# == Schema Info
# Schema version: 20101207054735
#
# Table name: pending_leave_requests
#
#  id          :integer(4)      not null, primary key
#  employee_id :integer(4)      not null, default(0)
#  leave_id    :integer(4)      not null, default(0)
#  created_at  :datetime
#  updated_at  :datetime

class PendingLeaveRequest < ActiveRecord::Base
end