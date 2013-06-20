require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'rspec'
require File.dirname(__FILE__) + '/testconfig';

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.default_selector = :css

#Capybara.default_browser = 'firefox'
Capybara.app_host = TestConfig["default_site"]
Capybara.default_wait_time = TestConfig["default_timeout"]

module Helpers
  def without_resynchronize
    page.driver.options[:resynchronize] = false
    yield
    page.driver.options[:resynchronize] = true
  end
end

World(Capybara::DSL, Helpers)