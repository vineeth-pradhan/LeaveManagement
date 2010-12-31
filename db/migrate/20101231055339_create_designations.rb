class CreateDesignations < ActiveRecord::Migration
  def self.up
    create_table :designations do |t|
      t.string :designation_type, :limit => 50, :default => '', :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :designations
  end
end
