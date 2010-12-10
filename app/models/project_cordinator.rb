# == Schema Info
# Schema version: 20101207054735
#
# Table name: employees
#
#  id                        :integer(4)      not null, primary key
#  approving_manager_id      :integer(4)
#  crypted_password          :string(40)
#  designation               :string(50)      not null, default("")
#  email                     :string(100)
#  first_name                :string(100)     not null, default("")
#  joining_date              :datetime        not null
#  last_name                 :string(100)     not null, default("")
#  login                     :string(40)      not null, default("")
#  remember_token            :string(40)
#  salt                      :string(40)
#  created_at                :datetime
#  remember_token_expires_at :datetime
#  updated_at                :datetime

class ProjectCordinator < Employee
  self.inheritance_column = "designation"
end