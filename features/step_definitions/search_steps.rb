Given /the following stakeholders exist/ do |people_table|
  people_table.hashes.each do |person|
    @person = Person.create!(person)
  end
end

Given /the following individuals exist/ do |people_table|
  people_table.hashes.each do |person|
    @person = Person.new.update_with(person)
  end
end

Given /the following companies exist/ do |companies_table|
  companies_table.hashes.each do |company|
    @company = Company.create!(company)
  end
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


