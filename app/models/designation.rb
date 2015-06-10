class Designation < ActiveRecord::Base
  REPORT_GENERATORS=["HrAssociate","HrManager"]
  has_many :employees
  
  validates_presence_of :designation_type
end
