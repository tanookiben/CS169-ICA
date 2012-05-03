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
  
  Given I am on the homepage
  Then I should see "Sign In"
  When I follow "Sign In"
  Then I follow "Twitter"
  Then I should be on the home page
  
@omniauth_valid_user  
Scenario: pre-selecting and filling in contact information correctly for individuals
  Given I am on the "Colin Harnes" individual page
  And I follow "Edit"
  Then I should be on the edit page for "Colin Harnes"
  And I should see "Colin Harnes"
  And "advisor_type" field should be selected for "Advisor"
  And the "advisor[first_name]" field should contain "Colin"
  And the "advisor[last_name]" field should contain "Harnes"
  And the "advisor[occupation]" field should contain "Dreamteller"
  #add other pre-fillable fields here: email, phone, website, and notes

@omniauth_valid_user
Scenario: pre-selecting and filling in contact information correctly for companies

  Given I am on the "John's Bank" company page
  And I follow "Edit"
  Then I should be on the company edit page for "John's Bank"
  And I should see "John's Bank"
  And "company[type]" field should be selected for "Portfolio Company"
  And the "portfolio_company_name" field should contain "John's Bank"
  And the "portfolio_company_representative_role" field should contain "CEO"
  And the "portfolio_company_representative_name" field should contain "John Smith"
  #add other pre-fillable fields here: email, phone, website, and notes
  
@omniauth_valid_user  
Scenario: updating individual information - valid update

  Given I am on the "Colin Harnes" individual page
  And I follow "Edit"
  Then I should be on the edit page for "Colin Harnes"
  And "advisor_type" field should be selected for "Advisor"
  When I fill in "Anothername" for "advisor_first_name"
  #And I add a new note
  #And I add a new phone
  #And I add a new email
  #And I add a new website
  And press "Update"
  Then I should be on the "Anothername Harnes" individual page
  And I should see "Anothername Harnes"

@omniauth_valid_user 
Scenario: updating individual information - invalid update

  Given I am on the "Colin Harnes" individual page
  And I follow "Edit"
  Then I should be on the edit page for "Colin Harnes"
  When I fill in "" for "advisor_first_name"
  And press "Update"
  Then I should be on the edit page for "Colin Harnes"
  And I should see "Error!"
  
@omniauth_valid_user
Scenario: updating company information - valid update

  Given I am on the "Faye Future" company page
  And I follow "Edit"
  Then I should be on the company edit page for "Faye Future"
  Then "company[type]" field should be selected for "education"
  When I fill in "education_company_representative_role" with "Another Role"
  #And I add a new note
  #And I add a new phone
  #And I add a new email
  #And I add a new website
  And press "Update"
  Then I should be on the "Faye Future" company page
  And I should see "Another Role"
  

@omniauth_valid_user
Scenario: updating company information - invalid update

  Given I am on the "Faye Future" company page
  And I follow "Edit"
  Then I should be on the company edit page for "Faye Future"
  When I fill in "education_company_representative_name" with ""
  And press "Update"
  Then I should be on the company edit page for "Faye Future"
  And I should see "Error!"

@omniauth_valid_user   
Scenario: updating company type

  Given I am on the "Harnes Dreaming" company page
  And I follow "Edit"
  Then I should be on the company edit page for "Harnes Dreaming"
  Then "company[type]" field should be selected for "Education Company"
  When I select "Portfolio Company" from "education_company[type]"
  And press "Update"
  Then I should be on the "Harnes Dreaming" company page
  Then "company[type]" field should be selected for "Portfolio Company"
  
