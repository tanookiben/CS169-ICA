Feature: An ICA admin should be able to search the global contacts list
  As an ICA admin
  I want to search the global contacts list
  so that I can look up contact information.

Background: all companies have been added to the database
  Given the following individuals exist:
  | first_name   | last_name     | type            | occupation   |
  | John         | Smith         | Individual      | Teller       |
  | Gregg        | Fields        | Advisor         | Storyteller  |
  | Jack         | Mitchell      | Board           | Bankteller   |
  | Faye         | Johnson       | Individual      | Futureteller |
  | Colin        | Harnes        | Advisor         | Dreamteller  |

 And the following companies exist:
  | name               | representative_role | representatice_id | type                          |
  | John's Bank        | CEO                 | 1                 | portfolio                     |
  | Faye Future        | financial manager   | 4                 | education                     |
  | Mitchell's Bank    | teller              | 3                 | professional_service_provider |
  | Harnes Dreamimg    | bookie              | 5                 | education                     |
  | Random Company     |                     |                   | professional_service_provider |

Senario: search by company name

  Given I am on the home page
  And I fill in "search" with "John's Bank"
  When I press "Search"
  Then I should see all records that contain "John's Bank"

Senario: Search company, but individual is deleted 
	
  Given I am on the home page
  And I fill in "search" with "John Smith"
  When I press "Search"
  Then I should see all records that contain "John Smith"
  And I follow "John Smith"
  When I press "Delete"
  And I should see an alert "Are you sure?"
  When I press "OK"
  Then I should be on the home page
  Then I fill in "search" with "John's Bank"
  Then I should see all records that contain "John's Bank"
  And I should not see "John Smith"

Scenario: When creating a company the name has to be filled in
  Given I am on the new company page
  When I have the "name" field match ""
  And I press "Create"
  Then I should see an alert "Must enter a name"
  And I should be on the new company page

Scenario: When creating a company the types can be changed
  Given I am on the new company page
  And I fill in "name" with "Fake Name"
  And I select "Education Company" from the "type" field
  And I press "Create"
  Then I should be on the home page
  And I fill in "search" with "Fake Name"
  When I press "Search"
  Then I should see all records that contain "Fake Name"
  Then I follow "Fake Name"
  Then I should be on the "Fake Name" page
  Then I press "Edit"
  And I should be on the edit page
  Then I select "Portfolio Company" from the "type" field
  And I press "Create"
  Then I should be on the home page
  And I fill in "search" with "Fake Name"
  When I press "Search"
  Then I should see all records that contain "Fake Name"
  And I should see "Portfolio Company"
 
