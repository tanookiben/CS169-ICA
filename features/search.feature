Feature: An ICA admin should be able to search the global contacts list
  As an ICA admin
  I want to search the global contacts list
  so that I can look up contact information.

Background: all stakeholders have been added to the database

  Given the following stakeholders exist:
  | first_name   | last_name     | type            | occupation   |
  | John         | Smith         | Entreprenuer    | Teller       |
  | Gregg        | Fields        | Bank            | Storyteller  |
  | Jack         | Mitchell      | Board           | Bankteller   |
  | Faye         | Johnson       | Entrepreneur    | Futureteller |
  | Colin        | Harnes        | Advisor         | Dreamteller  |


Scenario: search with empty string should return the entire contacts list

   Given I am on the home page
   When I press "Search"
   Then I should see the complete global contacts list 

Scenario: search with non-empty string should return records that contain the string (in any field)

  Given I am on the home page
  And I fill in "search" with "John"
  When I press "Search"
  Then I should see all records that contain "John"
  
Scenario: search with non-empty string and found no matching record should not display any records

  Given I am on the home page
  And I fill in "search" with "Simon"
  When I press "Search"
  Then I should not see any records
