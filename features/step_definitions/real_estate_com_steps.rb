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
  @links_to_pages = {}
  results.each do |element|
    @links_to_pages[element[:text]] = element[:href]
  end
  verify_links_to_pages(@links_to_pages)
end

When(/^I search for the following property$/) do |search_table|
  page.visit '/buy'
  selection_criteria = search_table.rows_hash
  select_location(selection_criteria)
  select_property_type(selection_criteria)
  select_max_price(selection_criteria)
  search_properties
end

Then(/^the results page shows the results for '(.*)' and '(.*)'$/) do |state, suburb|
  results_where = find('span[class="whereTerm"]')
  results_where.text.should include(state)
  results_where.text.should include(suburb)
end

#todp - verify location of each listing, paginate through results
Then(/^all the listings match the State and Suburb$/) do
  all_matching_properties = all('a[rel="listingName"]')
  puts "#{all_matching_properties}"
  all_matching_properties.each do |element|
    puts "#{element}"
  end
end

#TODO - move to a pageObject
def select_location(selection_criteria)
  search_location_criteria = "#{selection_criteria[:suburb]};#{selection_criteria[:state]}"
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
    link.should include(text.tr(" ","-").chomp("s"))
    page.visit(link)
  end
end