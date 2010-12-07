class President < Employee
  self.inheritance_column = "designation"
end