class LeavePolicy < ActiveRecord::Base
  has_many :available_offs
  has_many :applied_offs
  
  #TODO: validates_numericality_of :no_of_days
  
  validates_presence_of :policy_type
  validates_presence_of :no_of_days
  
  before_save :upcase_policy_type!
  
  def upcase_policy_type!
    self.policy_type.upcase!
  end
end
