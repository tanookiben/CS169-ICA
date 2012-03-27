Feature: export a list of email addresses of stakeholders

  As an ICA admin
  I want to search for specific stakeholders
  So that I can find their contact information quickly and easily.

Background: all stakeholders have been added to the dabase

  Given the following stakeholders exist:
  | name          | contact          | type            |
  | John Smith    | johnsmit@gmail   | Entreprenuer    |
  | Gregg Fields  | gfields@yahoo    | Bank            |

  And I am on the login page

Scenario: I enter the search query and export the result as text
   When I login as "admin"
   Then I should be on the home page
   And I should see "John Smith"
   Then I select "Banks"
   And I should see "Gregg Fields"
   Then I press "Export"
   And I shold see a list of "Banks"


