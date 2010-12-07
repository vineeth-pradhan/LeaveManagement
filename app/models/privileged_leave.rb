class PrivilegedLeave < Leave
  self.inheritance_column = "leave_type"
end
