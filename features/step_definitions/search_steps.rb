Given /the following individuals exist/ do |people_table|
  @person1_attr = {:first_name => "John", :last_name => "Smith", :occupation => "Teller", :type => "Individual"}
  @person1 = Individual.new
  @person1.update_with(@person1_attr)  
  @person1.id.should == 1
  
  @person2_attr = {:first_name => "Gregg", :last_name => "Fields", :occupation => "Storyteller", :type => "Advisor"}
  @person2 = Advisor.new
  @person2.update_with(@person2_attr)
  @person2.id.should == 2
  
  @person3_attr = {:first_name => "Jack", :last_name => "Mitchell", :occupation => "Bankteller", :type => "Advisor"}
  @person3 = Advisor.new
  @person3.update_with(@person3_attr)
  @person3.id.should == 3
  
  @person4_attr = {:first_name => "Faye", :last_name => "Johnson", :occupation => "Futureteller", :type => "Individual"}
  @person4 = Individual.new
  @person4.update_with(@person4_attr)
  @person4.id.should == 4
  
  @person5_attr = {:first_name => "Colin", :last_name => "Harnes", :occupation => "Dreamteller", :type => "Advisor"}
  @person5 = Advisor.new
  @person5.update_with(@person5_attr)
  @person5.id.should == 5
end

Given /the following companies exist/ do |companies_table|
  @company1_attr = {:name => "John's Bank", :representative => Person.find(1), :representative_role => "CEO", :type => "PortfolioCompany"}
  @company1 = PortfolioCompany.new
  @company1.update_with(@company1_attr)
  @p1 = Person.find(1)
  @p1.first_name.should == ("John")
  
  @company2_attr = {:name => "Faye Future", :representative => Person.find(4), :representative_role => "financial manager", :type => "EducationCompany"}
  @company2 = EducationCompany.new
  @company2.update_with(@company2_attr)
  
  @company3_attr = {:name => "Mitchell's Bank", :representative => Person.find(3), :representative_role => "teller", :type => "ProfessionalServiceProvider"}
  @company3 = ProfessionalServiceProvider.new
  @company3.update_with(@company3_attr)
  
  @company4_attr = {:name => "Harnes Dreaming", :representative => Person.find(5), :representative_role => "bookie", :type => "EducationCompany"}
  @company4 = EducationCompany.new
  @company4.update_with(@company4_attr)
end

Then /I should see the complete global contacts list/ do
  rows = Person.all.size
  page.has_css?("table#people_table/tbody tr", :count => rows)
  
end

#And /^I am signed in$/ do
#  step %Q{I am on the homepage}
#  step %Q{I go to the signin page}
#  step %Q{I follow "Twitter"}
#  step %Q{I fill in "terriyeh" for "Username"}
#  step %Q{I fill in "askr0131" for "Password"}
#  step %Q{I press "Sign In"}
#  step %Q{I am on the homepage}
#  step %Q{I see "Success"}
#end

Then /I should see all records that contain "(.*)"/ do |term|
  @filtered_list = Person.where('first_name LIKE ?', '#{term}')
  @filtered_list += Person.where('last_name LIKE ?', '#{term}')
  @filtered_list += Person.where('occupation LIKE ?', '#{term}')
  
  @filtered_list.each do |elt|
    step %Q{I should see "#{elt.first_name}"}
    step %Q{I should see "#{elt.last_name}"}
    step %Q{I should see "#{elt.occupation}"}
  end
end

Then /I should not see any records/ do
   page.has_css?("table#people_table/tbody tr", :count => 0)
end

Then /^"([^"]*)" field should be selected for "(.*)"$/ do |field, value|
  page.has_xpath?("//select[@id = '#{field}']/option[text() = '#{value}']")
end


