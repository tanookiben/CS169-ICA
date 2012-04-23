Feature: An ICA admin should be able to update/edit a contact's information
  As an ICA admin
  I want to edit a contact's information
  so that I can keep the contact list and information updated.

Background: all contacts have been added to the database

  Given the following individuals exist:
  | first_name   | last_name     | type            | occupation   |
  | John         | Smith         | Individual      | Teller       |
  | Gregg        | Fields        | Advisor         | Storyteller  |
  | Jack         | Mitchell      | BoardMember     | Bankteller   |
  | Faye         | Johnson       | Individual      | Futureteller |
  | Colin        | Harnes        | Advisor         | Dreamteller  |
  
  And the following companies exist:
  | name               | representative_role | representative_id | type                        |
  | John's Bank        | CEO                 | 1                 | PortfolioCompany            |
  | Faye Future        | financial manager   | 4                 | EducationCompany            |
  | Mitchell's Bank    | teller              | 3                 | ProfessionalServiceProvider |
  | Harnes Dreamimg    | bookie              | 5                 | EducationCompany            |
  

Scenario: pre-selecting and filling in contact information correctly for individuals

  Given I am on the "Colin Harnes" individual page
  And I follow "Edit"
  Then I should be on the edit page for "Colin Harnes"
  And I should see "Colin Harnes"
  And "advisor_type" field should be selected for "Advisor"
  And the "person[first_name]" field should contain "Colin"
  And the "person[last_name]" field should contain "Harnes"
  And the "person[occupation]" field should contain "Dreamteller"


Scenario: pre-selecting and filling in contact information correctly for companies

  Given I am on the "John's Bank" company page
  And I follow "Edit"
  Then I should be on the company edit page for "John's Bank"
  And I should see "John's Bank"
  And "company[type]" field should be selected for "Portfolio Company"
  And the "portfolio_company_name" field should contain "John's Bank"
  And the "portfolio_company_representative_role" field should contain "CEO"
  And the "portfolio_company_representative_id" field should contain "1"
  
@wip
Scenario: updating individual information

  Given I am on the "Colin Harnes" individual page
  And I follow "Edit"
  Then I should be on the edit page for "Colin Harnes"
  And "advisor_type" field should be selected for "Advisor"
  When I fill in "Anothername" for "advisor_first_name"
  And press "Update"
  Then I should be on the "Anothername Harnes" page
  And I should see "Anothername Harnes"
 
@wip
Scenario: updating company name

  Given I am on the "Faye Future" company page
  And I follow "Edit"
  Then I should be on the company edit page for "Faye Future"
  Then "company[type]" field should be selected for "education"
  When I fill in "education_company_name" with "Not Faye"
  And press "Update"
  Then I should be on the "Not Faye Future" company page
  And I should see "Not Faye Future"
  

Scenario: updating company type

  Given I am on the "Harnes Dreaming" company page
  And I follow "Edit"
  Then I should be on the company edit page for "Harnes Dreaming"
  Then "company[type]" field should be selected for "Education Company"
  When I select "Portfolio Company" from "education_company[type]"
  And press "Update"
  Then I should be on the "Harnes Dreaming" company page
  Then "company[type]" field should be selected for "Portfolio Company"
  
