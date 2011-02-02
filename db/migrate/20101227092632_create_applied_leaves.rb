class CreateAppliedLeaves < ActiveRecord::Migration
  def self.up
    create_table :applied_offs do |t|
      t.integer        :available_off_id,               :null => false
      t.integer        :employee_id,                    :null => false
      t.string         :status,                         :null => false, :default => ''
      t.datetime       :from_date,                      :null => false
      t.datetime       :to_date,                        :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :applied_offs
  end
end
