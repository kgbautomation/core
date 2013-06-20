#These step definitions are used to fill out and manipulate form elements in a web page

When /^I enter "(.*)" into the "(.*)" field$/ do |text, field|
  page.fill_in(field, :with => text)
end

