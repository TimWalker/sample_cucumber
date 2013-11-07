Feature:
  Using the Cucumber w/Ruby framework complete the following tasks.
  Starting at http://www.realestate.com.au
  i.e. Buy link = realestate.com.au/buy

  Background:
    Given I am on the home page

  Scenario: Landing Page
    Then all the main navigation links yield expected landing pages

  Scenario:
    Build a Test that performs a search meeting the following criteria.
    When I search for the following property
      |State = VIC         |
      |Suburb = Richmond   |
      |Property Type = Flat|
      |Max Price = 500,000 |
    Then all the listings match the State and Suburb



