
Feature: An ICA admin should be able to add a new entrepreneur
  As an ICA admin
  I want to add new entrepreneurs
  So that I can retain their information.

Background: all stakeholders have been added to the database

  Given the following stakeholders exist:
  | name          | contact          | type            |
  | John Smith    | johnsmit@gmail   | Entreprenuer    |
  | Gregg Fields  | gfields@yahoo    | Bank            |

  And I am on the login page

Scenario: I want to add a new stakeholder

   When I login as "admin"
   Then I should be on the home page
   And I should see "John Smith"
   Then I press "New"
   And I should be on the Stakeholder Type page
   Then I select "Entrepreneur"
   Then I press "Next"
   And I should be on the New Entry page
   Then I fill in "Name" with "Dan Johnson"
   And I fill in "Email" with "dj@google.com"
   Then I press "Create"
   And I should be on the home page
   And I should see "Dan Johnson"

  

