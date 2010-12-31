Feature: Login user
	In order to apply for a leave
	As an employee
	I should login first
	
	Scenario: Employee's existance
	Given I have an user login blrsysadmin
	And having password system123
	Then I should be successfully logged in as blrsysadmin 
	
	Scenario: Employee's invalidity
	Given I have an user by login as blrsysadmin
	And password not equal to system123
	Then I should be shown a login error in a flash message as "Login failed"