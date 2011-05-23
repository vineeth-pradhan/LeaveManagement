module AppliedOffsHelper
  
  def fetch_available_leaves(e)
#    e.available_offs.collect{|a|
#      [a.leave_policy.policy_type.capitalize,a.id]
#      }
  available_offs=AvailableOff.all(:conditions =>["employee_id=?", e.id], :include => "leave_policy")
  available_offs.collect{|i| i.leave_policy.policy_type.capitalize}
  end  
end
