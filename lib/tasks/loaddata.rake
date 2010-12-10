require File.join(File.dirname(__FILE__), 'loadinitialdata.rb')

namespace :create do
  desc "Creates essential employees, with two VicePresident instances and an \
        admin to create other new employees"
  task :user => :environment do
    load_essential_employees
  end
end