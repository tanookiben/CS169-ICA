Feature: An ICA admin should be able to update/edit a contact's information
  As an ICA admin
  I want to edit a contact's information
  so that I can keep the contact list and information updated.

Background: all stakeholders have been added to the database

  Given the following stakeholders exist:
  | first_name   | last_name     | type            | occupation   |
  | John         | Smith         | Individual      | Teller       |
  | Gregg        | Fields        | Advisor         | Storyteller  |
  | Jack         | Mitchell      | Board           | Bankteller   |
  | Faye         | Johnson       | Individual      | Futureteller |
  | Colin        | Harnes        | Advisor         | Dreamteller  |
  
Scenario: pre-selecting and filling in contact information correctly

  Given I am on the "Colin Harnes" page
  And I follow "Edit"
  Then I should be on the edit page for "Colin Harnes"
  And I should see "Colin Harnes"
  And "advisor_type" field should be selected for "Advisor"
  And the "person[first_name]" field should contain "Colin"
  And the "person[last_name]" field should contain "Harnes"
  And the "person[occupation]" field should contain "Dreamteller"
  
Scenario: updating contact information

  Given I am on the "Colin Harnes" page
  And I follow "Edit"
  Then I should be on the edit page for "Colin Harnes"
  And "advisor_type" field should be selected for "Advisor"
  When I fill in "person[first_name]" with "Anothername"
  And press "Update"
  Then I should be on the "Anothername Harnes" page
  And I should see "Anothername Harnes"
  
