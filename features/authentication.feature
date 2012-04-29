Feature: An ICA admin should be able to log into the system
  As an ICA admin
  I want to log into the system
  so that I can access the global contacts list.

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

 
Scenario: ICA admins can log in with valid username and password
  Given I am on the homepage
  Then I should see "Sign In"
  When I follow "Sign In"
  Then I follow "Twitter"
  And I fill in "Username" with "terriyeh"
  And I fill in "Password" with "askr0131"
  And I press "Sign In"
  Then I should be on the home page
  
@wip
Scenario: non admins should not be able to log in
  Given I am on the homepage
  Then I should see "Sign In"
  When I follow "Sign In"
  Then I follow "Twitter"
  And I fill in "Username" with "nonadmin"
  And I fill in "Password" with "malicious"
  And I press "Sign In"
  Then I should be on the homepage
  And I should see "Sign In"

@wip
Scenario: ICA admin should see wrong-password alert
  Given I am on the login page
  Then I should see "Username"
  And I should see "Password"
  When I fill in "Username" with "admin"
  And I fill in "Password" with "forgotwhatitis"
  And I press "Log In"
  Then I should be on the login page
  And I should see "Error! Wrong password"
