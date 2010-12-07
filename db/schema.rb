# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101207054735) do

  create_table "approved_leaves", :force => true do |t|
    t.integer  "leave_id",    :default => 0, :null => false
    t.integer  "employee_id", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "login",                     :limit => 40,  :default => "", :null => false
    t.string   "first_name",                :limit => 100, :default => "", :null => false
    t.string   "last_name",                 :limit => 100, :default => "", :null => false
    t.string   "email",                     :limit => 100
    t.string   "designation",               :limit => 50,  :default => "", :null => false
    t.datetime "joining_date",                                             :null => false
    t.integer  "approving_manager_id"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "employees", ["login"], :name => "index_employees_on_login", :unique => true

  create_table "leaves", :force => true do |t|
    t.string   "leave_type",        :limit => 50, :default => "", :null => false
    t.integer  "employee_id",                     :default => 0,  :null => false
    t.integer  "casual_leaves",                   :default => 0,  :null => false
    t.integer  "privileged_leaves",               :default => 0,  :null => false
    t.integer  "sick_leaves",                     :default => 0,  :null => false
    t.integer  "earned_leaves",                   :default => 0,  :null => false
    t.integer  "year",                            :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pending_leave_requests", :force => true do |t|
    t.integer  "leave_id",    :default => 0, :null => false
    t.integer  "employee_id", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rejected_leaves", :force => true do |t|
    t.integer  "leave_id",    :default => 0, :null => false
    t.integer  "employee_id", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
