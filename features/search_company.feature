Feature: An ICA admin should be able to search the global contacts list
  As an ICA admin
  I want to search the global contacts list
  so that I can look up contact information.

Background: all companies have been added to the database

  Given the following companies exist:
  | company_name   | representative_name     | representative_role | company_type          |
  | Trader Joes    | Chris Loranger          | Manager             | Education Company     |
  | Intuit         | Gregg Fields            | Recruiter           | Education Company     |
  | Wal-Mart       | Oleksiy Krupnyk         | Greeter             | Education Company     |

Scenario: search by company name

  Given I am on the home page
  And I fill in "search" with "Intuit"
  When I press "Search"
  Then I should see all records that contain "Intuit"

Scenario: Search company, but individual is deleted 
	
  Given I am on the home page
  And I fill in "search" with "Oleksiy"
  When I press "Search"
  Then I should see all records that contain "Oleksiy"
  When I press "Delete"
  Then I should be on the home page
  Then I fill in "search" with "Wal-Mart"
  Then I should see all records that contain "Walmart"
  And I should not see "Oleksiy"

Scenario: When creating a company the name has to be filled in
  Given I am on the new company page
  When I when the "name" field matches ""
  And I press "Create"
  Then I should see "Error: must enter a name"
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
 
