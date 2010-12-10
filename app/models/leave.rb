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

class Leave < ActiveRecord::Base
  belongs_to :employee
  validates_presence_of :employee
  
  #belongs_to :applyable, :polymorphic => true(Not a sensible association)
  
  validates_presence_of       :employee_id
  validates_numericality_of   :employee_id
  
  validates_presence_of       :casual_leaves
  validates_numericality_of   :casual_leaves
  
  validates_presence_of       :privileged_leaves
  validates_numericality_of   :privileged_leaves
  
  validates_presence_of       :earned_leaves
  validates_numericality_of   :earned_leaves
  
  validates_presence_of       :sick_leaves
  validates_numericality_of   :sick_leaves

  validates_presence_of       :leave_type
  
  validates_presence_of       :year
  validates_numericality_of   :year
  
  #TODO: validates_presence_of :restricted_holidays "GOTTA FIGURE OUT HOW THIS HAS TO BE IMPLEMENTED"
  #TODO: validates_presence_of :from_date (These have to be present in the respective leave types)
  #TODO: validates_presence_of :till_date (These have to be present in the respective leave types)
  
end