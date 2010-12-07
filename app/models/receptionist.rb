class Receptionist < Employee
  self.inheritance_column = "designation"
end
