class CreateDayOffs < ActiveRecord::Migration
  def self.up
    create_table :day_offs do |t|
    t.string     :leave_policy_id,    :null => false, :default =>'',    :limit => 50
    t.integer    :employee_id,        :null => false, :default => 0
    t.decimal    :casual_offs,        :null => false, :default => 0.0,               :precision => 4,       :scale => 1
    t.decimal    :paid_offs,          :null => false, :default => 0.0,               :precision => 4,       :scale => 1
    t.decimal    :sick_offs,          :null => false, :default => 0.0,               :precision => 4,       :scale => 1
    t.decimal    :earned_offs,                        :default => 0.0,               :precision => 4,       :scale => 1
    t.decimal    :maternity_offs,     :null => false, :default => 0.0,               :precision => 4,       :scale => 1
    #TODO: t.integer    :restricted_holidays,  :null => false "FIGURE OUT HOW THIS HAS TO BE IMPLEMENTED"
    t.integer    :year,               :null => false, :default => 0
    
    t.timestamps
    end
  end

  def self.down
    drop_table :day_offs
  end
end
