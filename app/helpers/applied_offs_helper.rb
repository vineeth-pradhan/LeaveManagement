module AppliedOffsHelper
  
  def fetch_available_leaves(e)
    e.available_offs.collect{|a|
      [a.leave_policy.policy_type.capitalize,a.id]
      }
  end
  
end
