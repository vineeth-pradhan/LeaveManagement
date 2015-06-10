class CreateRestrictedHolidays < ActiveRecord::Migration
  def self.up
    create_table :restricted_holidays do |t|
      t.date        :rdate,            :null => false
      t.string      :occasion,         :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :restricted_holidays
  end
end
