class AppliedOff < ActiveRecord::Base
  belongs_to :available_off
  validates_presence_of :available_off_id
  
  belongs_to :employee_id
  validates_presence_of :employee_id
  
  validates_presence_of :status
  validates_presence_of :from_date
  validates_presence_of :to_date
end
