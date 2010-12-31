Given /^I have an user login (.+)$/ do |login|
  Employee.create!(:login => login,:password => 'system123',:password_confirmation => 'system123',:joining_date => Time.now, :designation => "SystemAdminLead")
end

Given /^having password (.+)$/ do |password|
  Employee.find_by_login('blrsysadmin').password == password
end

Then /^I should be successfully logged in as (.+)$/ do |login|
  Employee.find_by_login(login)
end

Given /^I have an user by login as (.+)$/ do |login|
  Employee.create!(:login => login,:password => 'system123',:password_confirmation => 'system123',:joining_date => Time.now, :designation => "SystemAdminLead")
end

Given /^password not equal to (.+)$/ do |password|
  Employee.find_by_login('blrsysadmin').password != password
end

Then /^I should be shown a login error in a flash message as (.+)$/ do |message|
  "Login failed" == message
end