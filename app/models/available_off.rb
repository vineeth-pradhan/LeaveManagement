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

class AvailableOff < ActiveRecord::Base
  belongs_to :employee
  validates_presence_of :employee_id
  validates_numericality_of   :employee_id
  
  belongs_to :leave_policy
  validates_presence_of :leave_policy_id
  validates_numericality_of   :leave_policy_id
  
  has_many :applied_offs
  
  #belongs_to :applyable, :polymorphic => true(Not a sensible association)
  
  validates_presence_of       :year
  validates_numericality_of   :year
  
  #TODO: validates_presence_of :restricted_holidays "GOTTA FIGURE OUT HOW THIS HAS TO BE IMPLEMENTED"
  #TODO: validates_presence_of :from_date (These have to be present in the respective leave types)
  #TODO: validates_presence_of :till_date (These have to be present in the respective leave types)
  
#  def before_create
#    self.maternity_offs = 0.0 unless self.employee.gender == 'M'
#  end
end