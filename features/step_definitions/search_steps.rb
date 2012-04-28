Given /the following individuals exist/ do |people_table|
  people_table.hashes.each do |person|
    @person = Person.create!(person)
  end
end

Given /the following companies exist/ do |companies_table|
  @company1_attr = {:name => "John's Bank", :representative => Person.find(1), :representative_role => "CEO", :type => "PortfolioCompany"}
  @company1 = PortfolioCompany.new
  @company1.update_with(@company1_attr)
  
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


