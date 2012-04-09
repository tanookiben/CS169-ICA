Feature: An ICA admin should be able to add new contact of any type
  As an ICA admin
  I want to add a new contact
  so that I can expand the contact list.

Background: all stakeholders have been added to the database

  Given the following stakeholders exist:
  | first_name   | last_name     | type            | occupation   |
  | John         | Smith         | Individual      | Teller       |
  | Gregg        | Fields        | Advisor         | Storyteller  |
  | Jack         | Mitchell      | Board           | Bankteller   |
  | Faye         | Johnson       | Individual      | Futureteller |
  | Colin        | Harnes        | Advisor         | Dreamteller  |
  
Scenario: Add a new contact

  Given I am on the home page
  When I follow "here"
  Then I should go to the create page
  When I select "Individual" from "type"
  And I fill in "first_name" with "Jake"
  And I fill in "last_name" with "Tyler"
  And I fill in "occupation" with "Priceteller"
  And I press "Create"
  Then I should go to the index page
  And I should see "Success!"
  
Scenario: Cannot add a new contact if missing info

  Given I am on the home page
  When I follow "here"
  Then I should go to the create page
  When I select "Individual" from "type"
  And I fill in "first_name" with "Jake"
  And I fill in "last_name" with "Tyler"
  And I press "Create"
  Then I should go to the index page
  And I should see "Error!"
  
  
