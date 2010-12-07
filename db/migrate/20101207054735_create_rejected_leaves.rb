class CreateRejectedLeaves < ActiveRecord::Migration
  def self.up
    create_table      :rejected_leaves do |t|
      t.integer       :leave_id,          :null => false, :default => 0
      t.integer       :employee_id,       :null => false, :default => 0 
      t.timestamps
    end
  end

  def self.down
    drop_table :rejected_leaves
  end
end
