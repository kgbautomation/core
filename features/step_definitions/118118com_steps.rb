#These step definitions correspond to actions used to manipulate elements in an active web page

Then /^I click the "(.*)" (link|button)$/ do |text, object|
  case object
    when "link"
	  click_link(text, visible: true)
	when "button"
	  click_button(text, visible: true)
  end
end

Then /^I click the first "(.*)" (link|button)$/ do |text, object|
  case object
    when "link"
	  page.all('a', :text => text, :visible => true).first.click
	when "button"
      page.all('button', :text => text, :visible => true).first.click
    end	  
end



