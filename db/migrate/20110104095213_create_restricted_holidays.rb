class CreateRestrictedHolidays < ActiveRecord::Migration
  def self.up
    create_table :restricted_holidays do |t|
      t.datetime    :date,             :null => false,        :default => Date.today
      t.string      :occasion,         :null => false,        :default => ''
      t.timestamps
    end
  end

  def self.down
    drop_table :restricted_holidays
  end
end
