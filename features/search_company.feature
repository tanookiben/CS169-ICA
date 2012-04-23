Feature: An ICA admin should be able to search the global contacts list
  As an ICA admin
  I want to search the global contacts list
  so that I can look up contact information.

Background: all companies have been added to the database
  Given the following individuals exist:
  | first_name   | last_name     | type            | occupation   |
  | John         | Smith         | Individual      | Teller       |
  | Gregg        | Fields        | Advisor         | Storyteller  |
  | Jack         | Mitchell      | BoardMember     | Bankteller   |
  | Faye         | Johnson       | Individual      | Futureteller |
  | Colin        | Harnes        | Advisor         | Dreamteller  |

<<<<<<< HEAD
 And the following companies exist:
  | name               | representative_role | representative_id | type                          |
  | John's Bank        | CEO                 | 1                 | portfolio                     |
  | Faye Future        | financial manager   | 4                 | education                     |
  | Mitchell's Bank    | teller              | 3                 | professional_service_provider |
  | Harnes Dreamimg    | bookie              | 5                 | education                     |
  | Random Company     |                     |                   | professional_service_provider |

=======
  Given the following companies exist:
  | company_name   | representative_name     | representative_role | company_type          |
  | Trader Joes    | Chris Loranger          | Manager             | Education Company     |
  | Intuit         | Gregg Fields            | Recruiter           | Education Company     |
  | Wal-Mart       | Oleksiy Krupnyk         | Greeter             | Education Company     |
  
>>>>>>> master
Scenario: search by company name

  Given I am on the home page
  And I fill in "search" with "John's Bank"
  When I press "Search"
  Then I should see all records that contain "John's Bank"

Scenario: Search company, but individual is deleted 
	
#  Given I am on the home page
#  And I fill in "search" with "John Smith"
#  When I press "Search"
#  Then I should see all records that contain "John Smith"
#  And I follow "John"
  Given I am on the "John Smith" individual page
  When I press "Delete"
  And I should see an alert "John Smith is the representative for John's Bank. Are you sure you want to delete individual?"
  When I press "OK"
  Then I should be on the home page
  Then I fill in "search" with "John's Bank"
  Then I should see all records that contain "John's Bank"
  And I should not see "John Smith"

Scenario: When creating a company the name has to be filled in
  Given I am on the create_company page
  And I fill in "company_name" with ""
  And I press "Create"
  Then I should see an alert "Must enter a name"
  And I should be on the new company page

Scenario: When creating a company the types can be changed
  Given I am on the create_company page
  And I fill in "company_name" with "Fake Name"
  And I select "Education Company" from "company_type"
  And I fill in "full_name" with "John Smith"
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

