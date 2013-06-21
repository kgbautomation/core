require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'rspec'
require File.dirname(__FILE__) + '/testconfig';
require_relative 'testconfig'

t = TestConfig.new

#The following defines the behaviour variables for webdriver
#Note that all of the actual variables and profiles are set in support/testconfig.yml

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.default_selector = :css
Capybara.default_wait_time = TestConfig["default_timeout"]
Capybara.app_host = TestConfig["default_site"]
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => TestConfig["default_browser"])  
end  

#This block is executed before any scenario is executed
#Before do
  #Before statements defined here
#end

#This block creates screen shots in features/screenshots/ in the case of a failure
#is raised during any scenario

After do |scenario| 
 if scenario.failed? 
   directory_name = "features/screenshots/" + "/" + scenario.name
   Dir::mkdir(directory_name) unless File.exists?(directory_name) 
   File.open(directory_name + "/" + Time.now.strftime("%d-%m-%y-%H-%M-%S") + "-#{scenario.name}.png",'wb') do |f|    
      f.write(Base64.decode64(page.driver.browser.screenshot_as(:base64)))
   end
 end
end

#This block checks for any scenario tagged @debug and requires the user/runner to 
#press enter in order to manually step through each automated step

AfterStep('@debug') do
  if TestConfig["run_headless"] != true
    print "Press return to continue..."
    STDIN.getc
  else
    print "Currently running headless, step debugging is inactive"
  end
end

module Helpers
  def without_resynchronize
    page.driver.options[:resynchronize] = false
    yield
    page.driver.options[:resynchronize] = true
  end  
end

World(Capybara::DSL, Helpers)