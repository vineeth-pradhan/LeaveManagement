class RestrictedHoliday < ActiveRecord::Base
  self.inheritance_column = "leave_type"
end
