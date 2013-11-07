require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'ruby-debug'



Capybara.default_driver = :selenium
Capybara.app_host = 'http://www.realestate.com.au'
World(Capybara)

Given(/^I am on the home page$/) do
  page.visit '/'
end

Then(/^all the main navigation links yield expected landing pages$/) do
  results = page.all('.rui-main-nav a')
  links_to_pages = {}
  results.each do |element|
    links_to_pages[element[:text]] = element[:href]
  end
  verify_links_to_pages(links_to_pages)
end

When(/^I search for the following property$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then(/^all the listings match the State and Suburb$/) do
  pending # express the regexp above with the code you wish you had
end

def verify_links_to_pages(links_to_verify)
  links_to_verify.each do | text, link |
    page.visit(link)
  end
end
