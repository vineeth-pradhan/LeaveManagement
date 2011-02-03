class IncludeAdminColumnForEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :is_admin, :boolean, :null=>false, :default => false
  end

  def self.down
    remove_column :employees, :is_admin
  end
end
