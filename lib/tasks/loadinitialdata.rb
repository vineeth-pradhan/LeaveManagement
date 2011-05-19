module LoadInitialData
#  require 'FasterCSV'
   require 'csv'
 def self.load_essential_employees
   CSV.foreach("#{RAILS_ROOT}/lib/tasks/CsvFiles/employees.csv") do |row|
   Employee.create!(       
    :login                 => row[0],
    :first_name            => row[1],
    :last_name             => row[2],
    :gender                => row[3],
    :password              => row[4],
    :password_confirmation => row[4],
    :designation_id        => Designation.find_by_designation_type(row[5]).id,
    :joining_date          => row[6],
    :approving_manager     => row[7],
    :is_admin              => row[8])
  end
 end
    
 def self.load_all_designations
  CSV.foreach("#{RAILS_ROOT}/lib/tasks/CsvFiles/desinations.csv") do |row|
   Designation.create!(
    :designation_type => row[0])
  end
 end
    
 def self.load_leave_policies
  CSV.foreach("#{RAILS_ROOT}/lib/tasks/CsvFiles/leave_policies.csv") do |row|
    LeavePolicy.create!(
    :policy_type  => row[0],
    :no_of_days   => row[1],
    :span_type    => row[2])
  end
 end
    
 def self.load_day_offs
  Employee.all.each do |e|             
   create_available_offs(e)
  end
 end
    
 def self.create_available_offs(e)
  LeavePolicy.all.each do |p| 
   next if e.gender == 'M' && p.policy_type == 'maternity'
    AvailableOff.create!(
    :leave_policy_id => p.id,
    :employee_id  => e.id,
    :no_of_days   => p.no_of_days)
  end
 end

end