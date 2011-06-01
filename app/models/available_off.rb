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
  
  #belongs_to :applyable, :polymorphic => true
  
  validates_presence_of       :year
  validates_numericality_of   :year
  #validates_numericality_of   :no_of_days, :greater_than => 0#, :unless => Proc.new{|a| a.leave_policy.policy_type == 'lossofpay'}

  #TODO: validates_presence_of :restricted_holidays
  #TODO: validates_presence_of :from_date (These have to be present in the respective leave types)
  #TODO: validates_presence_of :to_date (These have to be present in the respective leave types)
  #TODO: validates_numericality_of :no_of_days
  #TODO: validates_numericality_of :year
#  def restore_leaves(days)
#    self.update_attribute(:no_of_days, self.no_of_days += days)
#  end
  
  def deduct_leaves(days)
    self.update_attribute(:no_of_days, self.no_of_days -= days)
  end
end