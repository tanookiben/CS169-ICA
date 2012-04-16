Feature: An ICA admin should be able to search the global contacts list
  As an ICA admin
  I want to search the global contacts list
  so that I can look up contact information.

Background: all contacts have been added to the database

  Given the following individuals exist:
  | id  | first_name   | last_name     | type            | occupation   |
  | 1   | John         | Smith         | Entreprenuer    | Teller       |
  | 2   | Gregg        | Fields        | Bank            | Storyteller  |
  | 3   | Jack         | Mitchell      | Board           | Bankteller   |
  | 4   | Faye         | Johnson       | Entrepreneur    | Futureteller |
  | 5   | Colin        | Harnes        | Advisor         | Dreamteller  |
  
  And the following companies exist:
  | name               | representative_role | representatice_id | type                          |
  | John's Bank        | CEO                 | 1                 | portfolio                     |
  | Faye Future        | financial manager   | 4                 | education                     |
  | Mitchell's Bank    | teller              | 3                 | professional_service_provider |
  | Harnes Dreamimg    | bookie              | 5                 | education                     |


Scenario: search with empty string should return the entire contacts list

   Given I am on the home page
   When I press "Search"
   Then I should see the complete global contacts list containing all individuals and companies 

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
