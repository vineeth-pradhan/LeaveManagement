class RestrictedHoliday < ActiveRecord::Base
  validates_presence_of :rdate, :occasion
  
  validates_uniqueness_of :rdate, :occasion
end
