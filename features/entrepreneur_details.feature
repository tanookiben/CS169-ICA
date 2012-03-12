Feature: An ICA admin should be able to see details of an entrepreneur
  As an ICA admin
  I want to see entrepreneur details
  so that I can keep track of his/her progress.

Background: all stakeholders have been added to the database

  Given the following stakeholders exist:
  | name          | contact          | type            |
  | John Smith    | johnsmit@gmail   | Entreprenuer    |
  | Gregg Fields  | gfields@yahoo    | Bank            |

  And I am on the login page

Scenario: I want to see the details of an entrepreneur

   When I login as "admin"
   Then I should be on the home page
   And I should see "John Smith"
   Then I press "John Smith"
   And I should be on the Contact Details page
   Then I type "Completed" in "Edit"
   And I should see "Completed" 

