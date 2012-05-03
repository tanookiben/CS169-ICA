Given /^I am signed in$/ do  
  step %Q{I am on the twitter auth page}
  step %Q{I am on the twitter callback page}
end  

When /^Twitter authorizes me$/ do
  visit 'localhost:3000/auth/twitter/callback'
 # step %Q{I am on the twitter callback page}
end

