class IncludeAppiedOffAssociationInRestrictedHolidayTable < ActiveRecord::Migration
  def self.up
    add_column :applied_offs, :restricted_holiday_id, :integer
  end

  def self.down
    remove_column :applied_offs, :restricted_holiday_id
  end
end
