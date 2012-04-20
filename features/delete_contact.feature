Feature: An ICA admin should be able to delete a contact's information
  As an ICA admin
  I want to delete a contact's information
  so that I can clean up the contact list from time to time.

Background: all contacts have been added to the database

  Given the following individuals exist:
  | first_name   | last_name     | type            | occupation   |
  | John         | Smith         | Individual      | Teller       |
  | Gregg        | Fields        | Advisor         | Storyteller  |
  | Jack         | Mitchell      | BoardMember     | Bankteller   |
  | Faye         | Johnson       | Individual      | Futureteller |
  | Colin        | Harnes        | Advisor         | Dreamteller  |



  And the following companies exist:
  | name               | representative_role | representatice_id | type                          |
  | John's Bank        | CEO                 | 1                 | portfolio                     |
  | Faye Future        | financial manager   | 4                 | education                     |
  | Mitchell's Bank    | teller              | 3                 | professional_service_provider |
  | Harnes Dreamimg    | bookie              | 5                 | education                     |
  | Random Company     |                     |                   | professional_service_provider |
  
Scenario: deleting an individual who is linked to a company - confirm
  Given I am on the "John Smith" page
  When I press "Delete"
  Then I should see an alert "John Smith is the representative for John's Bank.  Are you sure you want to delete individual?"
  When I press "OK"
  Then I should be on the home page
  And I should see "Success!"
  
Scenario: deleting an individual who is linked to a company - cancel
  Given I am on the "John Smith" page
  When I press "Delete"
  Then I should see an alert "John Smith is the representative for John's Bank.  Are you sure you want to delete individual?"
  When I press "Cancel"
  Then I should be on the "John Smith" page

Scenario: deleting a company without representative information - confirm
  Given I am on the "Faye Future" page
  When I press "Delete"
  Then I should see an alert "Are you sure?"
  When I press "OK"
  Then I should be on the home page
  
  Scenario: deleting a company without representative information - cancel
  Given I am on the "Faye Future" page
  When I press "Delete"
  Then I should see an alert "Are you sure?"
  When I press "Cancel"
  Then I should be on the "Faye Future" page

Scenario: deleting an individual that is not linked to a company - confirm
  Given I am on the "John Smith" page
  When I press "Delete"
  Then I should see an alert "Are you sure?"
  When I press "OK"
  Then I should be on the home page
  And I should see "Success!"
  
Scenario: deleting an individual who is not linked to a company - cancel
  Given I am on the "John Smith" page
  When I press "Delete"
  Then I should see an alert "Are you sure?"
  When I press "Cancel"
  Then I should be on the "John Smith" page
  
Scenario: deleting a company that is linked to a representative - confirm and delete rep
  Given I am on the "Mitchell's Bank" page
  When I press "Delete"
  Then I should see an alert "Mitchell's Bank has a representative.  Are you sure you want to delete company?"
  When I press "OK"
  Then I should be on the home page
  And I should see "Do you want to delete representative record as well?"
  When I press "Yes"
  Then I should be on the "Jack Mitchell" page
  
Scenario: deleting a company that is linked to a representative - confirm and NOT delete rep
  Given I am on the "Mitchell's Bank" page
  When I press "Delete"
  Then I should see an alert "Mitchell's Bank has a representative.  Are you sure you want to delete company?"
  When I press "OK"
  Then I should be on the home page
  And I should see "Do you want to delete representative record as well?"
  When I press "No"
  Then I should be on the home page
  
Scenario: deleting a company that is linked to a representative - cancel
  Given I am on the "Mitchell's Bank" page
  When I press "Delete"
  Then I should see an alert "Mitchell's Bank has a representative.  Are you sure you want to delete company?"
  When I press "Cancel"
  Then I should be on the "Mitchell's Bank" page
  
