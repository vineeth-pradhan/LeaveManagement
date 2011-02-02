class LeavePolicy < ActiveRecord::Base
  has_many :available_offs
  has_many :applied_offs
end
