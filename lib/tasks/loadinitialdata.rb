require 'FasterCSV'

def load_essential_employees
     FasterCSV.foreach("#{RAILS_ROOT}/lib/tasks/CsvFiles/employees.csv") do |row|
       Employee.create!(       
       :login                 => row[0],
       :first_name            => row[1],
       :last_name             => row[2],
       :gender                => row[3],
       :password              => row[4],
       :password_confirmation => row[4],
       :designation_id        => Designation.find_by_designation_type(row[5]).id,
       :joining_date          => row[6])
     end
end

def load_all_designations
     FasterCSV.foreach("#{RAILS_ROOT}/lib/tasks/CsvFiles/desinations.csv") do |row|
       Designation.create!(
       :designation_type => row[0])
     end
end

def load_leave_policies
     FasterCSV.foreach("#{RAILS_ROOT}/lib/tasks/CsvFiles/leave_policies.csv") do |row|
       LeavePolicy.create!(
       :day_off_type => row[0],
       :no_of_days   => row[1],
       :span_type    => row[2])
     end
end

def load_day_offs
  day_off_types=LeavePolicy.all.collect {|x| x.day_off_type}
  Employee.all.each do |emp| 
    DayOff.create!(
    :leave_policy_id        => LeavePolicy.find_by_day_off_type(day_off_types.shift).id,
    :employee_id            => emp.id,
    :casual_offs            => LeavePolicy.find_by_day_off_type('casual').no_of_days,
    :earned_offs            => LeavePolicy.find_by_day_off_type('earned').no_of_days,
    :maternity_offs         => LeavePolicy.find_by_day_off_type('maternity').no_of_days,
    :paid_offs              => LeavePolicy.find_by_day_off_type('paid').no_of_days,
    :sick_offs              => LeavePolicy.find_by_day_off_type('sick').no_of_days,
    :year                   => Date.today.year)
  end
end