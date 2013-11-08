require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'ruby-debug'



Capybara.default_driver = :selenium
Capybara.app_host = 'http://www.realestate.com.au'
World(Capybara)

#Given(/^I am on the home page$/) do
#  page.visit '/'
#end

Then(/^all the main navigation links yield expected landing pages$/) do
  results = page.all('.rui-main-nav a')
  links_to_pages = {}
  results.each do |element|
    links_to_pages[element[:text]] = element[:href]
  end
  verify_links_to_pages(links_to_pages)
end

When(/^I search for the following property$/) do |search_table|
  page.visit '/buy'
  selection_criteria = search_table.rows_hash
  select_location(selection_criteria)
  select_property_type(selection_criteria)
  select_max_price(selection_criteria)
  @results = search_properties
end

Then(/^all the listings match the State and Suburb$/) do
  puts "#{@results}"
end

def select_location(selection_criteria)
  search_location_criteria = "#{selection_criteria[:suburb]};#{selection_criteria[:state]}"
  puts "Searching for properties in #{search_location_criteria}"
  fill_in('where', :with => search_location_criteria)
end

def expand_property_types
  group_input = find('input[name="propertytypegroup"]')
  group_input.click
end

def select_property_type(selection_criteria)
  expand_property_types
  property_type = find('input[value="apartment"]')
  property_type.click
end

def expand_list_price
  group_input = find('input[id="maxPrice"]')
  group_input.click
end

def select_max_price(selection_criteria)
  expand_list_price
  price = find(".LMIDDNoSection", :text => "500,000")
  price.click
end

def search_properties
  search_button = find('input[id="searchBtn"]')
  search_button.click
end

def verify_links_to_pages(links_to_verify)
  links_to_verify.each do | text, link |
    puts "Verify that #{text} is what #{link} refers to"
    page.visit(link)
  end
end