#These steps are used to verify text and success/error messages on active web pages

Then /^I should see(?:| the) "(.*)" (?:message|text)$/ do |text|
  page.should have_content(text)
end

Then /^I should see(?:| the) following (?:message|text):$/ do |table|
  table.raw.each do |row|
    row.each do |cell|
	  page.should have_content(cell)
	end  
  end  
end
