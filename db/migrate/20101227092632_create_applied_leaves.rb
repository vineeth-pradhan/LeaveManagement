class CreateAppliedLeaves < ActiveRecord::Migration
  def self.up
    create_table :applied_offs do |t|
      t.integer        :day_off_id,                     :null => false, :default => 0
      t.integer        :employee_id,                    :null => false, :default => 0
      t.string         :applied_leave_status,           :null => false, :default => ''
      t.datetime       :from_date,                      :null => false
      t.datetime       :to_date,                        :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :applied_offs
  end
end
