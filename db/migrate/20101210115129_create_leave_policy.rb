class CreateLeavePolicy < ActiveRecord::Migration
  def self.up
    create_table :leave_policies do |t|
      t.string    :policy_type,                     :null => false,            :default => ""
      t.decimal   :no_of_days,               :null => false,            :default => 0,     :precision => 4,       :scale => 1
      t.string    :span_type,                :null => false,            :default => ""
    end
  end

  def self.down
    drop_table :leave_policies
  end
end
