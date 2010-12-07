class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees, :force => true do |t|
      t.string   :login,                            :limit => 40,   :null => false, :default => ''
      t.string   :first_name,                       :limit => 100,  :null => false, :default => ''
      t.string   :last_name,                        :limit => 100,  :null => false, :default => ''
      t.string   :email,                            :limit => 100
      t.string   :designation,                      :limit => 50,   :null => false, :default => ''
      t.datetime :joining_date,                                     :null => false, :default => '0000-00-00'
      t.integer  :approving_manager_id #FIXME: A LOOPHOLE! Approving managers are also employees, so who should to be existing first in order for this field to be non null?
      t.string   :crypted_password,                 :limit => 40
      t.string   :salt,                             :limit => 40
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :remember_token,                   :limit => 40
      t.datetime :remember_token_expires_at


    end
    add_index :employees, :login, :unique => true
  end

  def self.down
    drop_table :employees
  end
end
