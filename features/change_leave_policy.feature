Feature: Change leave policy
In order to change the leave policy
As a Human Resource master
I need to be able to delete and include new leave policies

Scenario: Delete a leave policy
Given I have a leave policy <policy_type>
| policy_type |
| special |
When I click the remove link for the policy type "special"
Then I should not see that "special" listed in the policy_type table