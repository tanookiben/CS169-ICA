Feature: An ICA admin should be able to update/edit a contact's information
  As an ICA admin
  I want to edit a contact's information
  so that I can keep the contact list and information updated.

Background: all contacts have been added to the database

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
  
Scenario: pre-selecting and filling in contact information correctly for individuals

  Given I am on the "Colin Harnes" page
  And I follow "Edit"
  Then I should be on the edit page for "Colin Harnes"
  And I should see "Colin Harnes"
  And "advisor_type" field should be selected for "Advisor"
  And the "person[first_name]" field should contain "Colin"
  And the "person[last_name]" field should contain "Harnes"
  And the "person[occupation]" field should contain "Dreamteller"
  
Scenario: pre-selecting and filling in contact information correctly for companies

  Given I am on the "John's Bank" page
  And I follow "Edit"
  Then I should be on the edit page for "John's Bank"
  And I should see "John's Bank"
  And "company_type" field should be selected for "portfolio"
  And the "name" field should contain "John's Bank"
  And the "representative_role" field should contain "CEO"
  And the "representative_id" field should contain "1"
  
Scenario: updating individual information

  Given I am on the "Colin Harnes" page
  And I follow "Edit"
  Then I should be on the edit page for "Colin Harnes"
  And "advisor_type" field should be selected for "Advisor"
  When I fill in "person[first_name]" with "Anothername"
  And press "Update"
  Then I should be on the "Anothername Harnes" page
  And I should see "Anothername Harnes"
  
Scenario: updating company name

  Given I am on the "Faye Future" page
  And I follow "Edit"
  Then I should be on the edit page for "Faye Future"
  And "company_type" field should be selected for "education"
  When I fill in "name" with "Not Faye"
  And press "Update"
  Then I should be on the "Not Faye Future" page
  And I should see "Not Faye Future"
  
Scenario: updating company type

  Given I am on the "Harnes Dreaming" page
  And I follow "Edit"
  Then I should be on the edit page for "Harnes Dreaming"
  And "company_type" field should be selected for "education"
  When I select "portfolio" for "company_type"
  And press "Update"
  Then I should be on the "Harnes Dreaming" page
  And "company_type" field should be seleced for "portfolio"
  
