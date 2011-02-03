class LeavePolicy < ActiveRecord::Base
  has_many :available_offs
  has_many :applied_offs
  
  #TODO: validates_numericality_of :no_of_days
end
