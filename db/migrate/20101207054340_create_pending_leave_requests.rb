class CreatePendingLeaveRequests < ActiveRecord::Migration
  def self.up
    create_table       :pending_leave_requests do |t|
      t.integer        :leave_id,         :null => false, :default => 0
      t.integer        :employee_id,      :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :pending_leave_requests
  end
end
