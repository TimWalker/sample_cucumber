@real_estate_com_au
Feature:
  Using the Cucumber w/Ruby framework complete the following tasks.
  Starting at http://www.realestate.com.au
  i.e. Buy link = realestate.com.au/buy

#  Background:
#    Given I am on the home page

  @nav
  Scenario: Landing Page
    Then all the main navigation links yield expected landing pages

  @wip @search
  Scenario:
    Build a Test that performs a search meeting the following criteria.
    When I search for the following property
      |state                |       VIC          |
      |suburb               |       Richmond     |
      |property type        |       Flat         |
      |max price            |       500,000      |
    Then all the listings match the State and Suburb



