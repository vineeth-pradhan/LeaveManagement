class AppliedOff < ActiveRecord::Base
  belongs_to :available_off
  validates_presence_of :available_off_id
  validates_associated :available_off
  
  belongs_to :employee
  validates_presence_of :employee_id
  
#  belongs_to :leave_policy
#  validates_presence_of :leave_policy_id
  
  validates_presence_of :status
  validates_presence_of :from_date
  validates_presence_of :to_date
  
  validates_inclusion_of :status, :in => %w(pending rejected approved)
  
  validate :from_date_and_to_date
  
  def from_date_and_to_date
    self.errors.add_to_base("From date and to date cannot be same") if self.from_date == self.to_date
  end
  
  def before_create
    #if self.employee.available_offs.find_by_leave_policy_id(self.available_off.leave_policy.id).no_of_days - 1 < 0
    if self.available_off.no_of_days < ((self.to_date-self.from_date)/(24*60*60))
      self.errors.add_to_base("You don't have enough leaves left in your account")
      return false
    end
  end
  
  def after_create
    update_available_leaves(self)
  end
  
  def update_available_leaves(applied_off)
    applied_off.available_off.update_attributes(:no_of_days => calculate_no_of_days(applied_off))
  end
  
  def calculate_no_of_days(applied_off)
    applied_off.available_off.no_of_days-(applied_off.to_date-applied_off.from_date)/(24*60*60)
  end
  
  def self.list_all_pending_leaves
    find_all_by_status('pending')
  end
  
  def approve
    self.update_attributes(:status => 'approved')
  end
  
  def reject
    self.update_attributes(:status => 'rejected')
    self.available_off.restore_leaves(1)
  end
end
