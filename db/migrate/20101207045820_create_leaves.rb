class CreateLeaves < ActiveRecord::Migration
  def self.up
    create_table :leaves do |t|
    t.string     :leave_type,           :null => false, :default =>'',   :limit => 50
    t.integer    :employee_id,          :null => false, :default => 0
    t.integer    :casual_leaves,        :null => false, :default => 0
    t.integer    :privileged_leaves,    :null => false, :default => 0
    t.integer    :sick_leaves,          :null => false, :default => 0
    t.integer    :earned_leaves,        :null => false, :default => 0
    #TODO: t.integer    :restricted_holidays,  :null => false "FIGURE OUT HOW THIS HAS TO BE IMPLEMENTED"
    t.integer    :year,                 :null => false, :default => 0
    
      t.timestamps
    end
  end

  def self.down
    drop_table :leaves
  end
end
