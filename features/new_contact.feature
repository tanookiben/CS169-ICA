Feature: An ICA admin should be able to add new contact of any type
  As an ICA admin
  I want to add a new contact
  so that I can expand the contact list.

Background: all individuals have been added to the database

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
  
Scenario: Add a new individual

  Given I am on the home page
  When I follow "here"
  Then I should be on the create_individual page
  When I select "Individual" from "person[type]"
  And I fill in "person[first_name]" with "Jake"
  And I fill in "person[last_name]" with "Tyler"
  And I fill in "person[occupation]" with "Priceteller"
  And I press "Create"
  Then I should be on the "Jake Tyler" individual page
  And I should see "Success!"
  
Scenario: Add a new company

  Given I am on the home page
  When I follow "Or click here"
  Then I should be on the create_company page
  When I select "Portfolio Company" from "company[type]"
  And I fill in "company[name]" with "Cutesy"
  And I fill in "company[representative_role]" with "Cutie"
  And I fill in "company[representative_id]" with "2"
  And I press "Create"
  Then I should be on the "Cutesy" company page
  And I should see "Success!"
  
Scenario: Cannot add a new individual if missing info

  Given I am on the home page
  When I follow "here"
  Then I should be on the create_individual page
  When I select "Individual" from "person[type]"
  And I fill in "person[first_name]" with "Jake"
  And I fill in "person[last_name]" with "Tyler"
  And I press "Create"
  Then I should be on the create_individual page
  And I should see "Error!"

@wip
Scenario: Cannot add a new company if missing name

  Given I am on the home page
  When I follow "Or click here"
  Then I should be on the create_company page
  When I select "Portfolio Company" from "company[type]"
  And I fill in "company[representative_role]" with "Cutie"
  And I fill in "company[representative_id]" with "2"
  And I press "Create"
  Then I should be on the create_company page
  And I should see "Error!"
  
@wip
Scenario: Can still add a new company if missing representative information

  Given I am on the home page
  When I follow "Or click here"
  Then I should be on the create_company page
  When I select "Portfolio" from "company[type]"
  And I fill in "company[name]" with "Cutesy"
  And I press "Create"
  Then I should be on the create_company page
  And I should see "Error!"
  
  
