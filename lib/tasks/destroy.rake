namespace :destroy do
  desc "Destroys all employees from the database."
  task :employees => :environment do
    puts "Destroying all employees"
  Employee.delete_all
  end

  desc "Destroys all designations from the database."
  task :designations => :environment do
      puts "Destroying all designations"
    Designation.delete_all
  end
  
  desc "Destroys all the leave policies from the database"
  task :leave_policies => :environment do
      puts "Destroying all leave_policies"
      LeavePolicy.delete_all
  end
  
  desc "Destroys all the leave policies from the database"
  task :day_offs => :environment do
      puts "Destroying all the day_offs for all the employees"
      DayOff.delete_all
  end
  
  desc "Destroys 'desinations', 'employees', 'leave_policies'."
  task :all => [:designations, :employees, :leave_policies, :day_offs]
end