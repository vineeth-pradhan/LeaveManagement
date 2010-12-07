class AccountsAdmin < Employee
  self.inheritance_column = "designation"
end
