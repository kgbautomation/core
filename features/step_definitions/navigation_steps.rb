#These step definitions are used to navigate web driver to various web sites

Given /^I visit "(.*)"$/ do |site|
  visit site
end

Given /^I visit the default site$/ do 
  visit ('/')
end