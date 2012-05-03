Feature: An ICA admin should be able to add new contact of any type
  As an ICA admin
  I want to add a new contact
  so that I can expand the contact list.

Background: all individuals have been added to the database

  Given the following individuals exist:
  | first_name   | last_name     | type            | occupation   |
  | John         | Smith         | Individual      | Teller       |
  | Gregg        | Fields        | Advisor         | Storyteller  |
  | Jack         | Mitchell      | Advisor         | Bankteller   |
  | Faye         | Johnson       | Individual      | Futureteller |
  | Colin        | Harnes        | Advisor         | Dreamteller  |
  
  And the following companies exist:
  | name               | representative_role | representative_id | type                        | 
  | John's Bank        | CEO                 | 1                 | PortfolioCompany            |
  | Faye Future        | financial manager   | 4                 | EducationCompany            |
  | Mitchell's Bank    | teller              | 3                 | ProfessionalServiceProvider |
  | Harnes Dreamimg    | bookie              | 5                 | EducationCompany            |
  
  Given I am on the homepage
  Then I should see "Sign In"
  When I follow "Sign In"
  Then I follow "Twitter"
  Then I should be on the home page

@omniauth_valid_user
Scenario: Add a new individual 

  Given I am on the home page
  When I follow "New Person"
  Then I should be on the create_individual page
  When I select "Individual" from "person[type]"
  And I follow "Add Phone Number"
  Then "person_phone_numbers_attributes_new_phone_numbers_number" field should be selected for "Business"
  And I follow "Add Email Address"
  Then "person_email_addresses_attributes_new_email_addresses_address" field should be selected for "Business"
  And I follow "Add Website"
  Then "person_websites_attributes_new_websites_url" field should be selected for "Business"
  And I follow "Add Note"
  And I fill in "person[first_name]" with "Jake"
  And I fill in "person[last_name]" with "Tyler"
  And I fill in "person[occupation]" with "Priceteller"
  And I press "Create"
  Then I should be on the "Jake Tyler" individual page
  And I should see "Success!"

@omniauth_valid_user
Scenario: Add a new company

  Given I am on the home page
  When I follow "New Company"
  Then I should be on the create_company page
  When I select "Portfolio Company" from "company[type]"
  And I follow "Add Phone Number"
  Then "company_phone_numbers_attributes_new_phone_numbers_number" field should be selected for "Business"
  And I follow "Add Email Address"
  Then "company_email_addresses_attributes_new_email_addresses_address" field should be selected for "Business"
  And I follow "Add Website"
  Then "company_websites_attributes_new_websites_url" field should be selected for "Business"
  And I follow "Add Note"
  And I fill in "company[name]" with "Cutesy"
  And I fill in "company[representative_role]" with "Cutie"
  And I fill in "company[representative_name]" with "Gregg Fields"
  And I press "Create"
  Then I should be on the "Cutesy" company page
  And I should see "Success!"

@omniauth_valid_user
Scenario: Cannot add a new individual if missing occupation

  Given I am on the home page
  When I follow "New Person"
  Then I should be on the create_individual page
  When I select "Individual" from "person[type]"
  And I fill in "person[first_name]" with "Jake"
  And I fill in "person[last_name]" with "Tyler"
  And I press "Create"
  Then I should be on the create_individual page
  And I should see "Error!"

@omniauth_valid_user
Scenario: Cannot add a new individual if missing first name

  Given I am on the home page
  When I follow "New Person"
  Then I should be on the create_individual page
  When I select "Individual" from "person[type]"
  And I fill in "person[last_name]" with "Tyler"
  And I fill in "person[occupation]" with "Priceteller"
  And I press "Create"
  Then I should be on the create_individual page
  And I should see "Error!"

@omniauth_valid_user
Scenario: Cannot add a new individual if missing last name

  Given I am on the home page
  When I follow "New Person"
  Then I should be on the create_individual page
  When I select "Individual" from "person[type]"
  And I fill in "person[first_name]" with "Jake"
  And I fill in "person[occupation]" with "Priceteller"
  And I press "Create"
  Then I should be on the create_individual page
  And I should see "Error!"

@wip
Scenario: Cannot add a new company if missing name

  Given I am on the home page
  When I follow "New Company"
  Then I should be on the create_company page
  When I select "Portfolio Company" from "company[type]"
  And I fill in "company[representative_role]" with "Cutie"
  And I fill in "company[representative_name]" with "Cutie Pie"
  And I press "Create"
  Then I should be on the create_company page
  And I should see "Error!"
  
@omniauth_valid_user
Scenario: Cannot add a new company if missing representative name or role information

  Given I am on the home page
  When I follow "New Company"
  Then I should be on the create_company page
  When I select "Portfolio" from "company[type]"
  And I fill in "company[name]" with "Cutesy"
  And I press "Create"
  Then I should be on the create_company page
  And I should see "Error!"
  
  
