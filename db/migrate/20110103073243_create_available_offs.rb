class CreateAvailableOffs < ActiveRecord::Migration
  def self.up
    create_table :available_offs do |t|
      t.integer :leave_policy_id,      :null => false,     :default => 0
      t.integer :employee_id,          :null => false,     :default => 0
      t.decimal :no_of_days,           :null => false,     :default => 0.0,     :precision => 3,      :scale => 1
      t.integer :year,                 :null => false,     :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :available_offs
  end
end
