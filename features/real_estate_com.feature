@real_estate_com_au
Feature: Verify integrity of a real estate web site
  As a person demonstrating the use of Cucumber in a Ruby environment
  I want to provide some good examples of technique
  So that others may emulate or use as examples

  Background: Browse to home page at 'http://www.realestate.com.au'
    Given I am on the home page

  @nav
  Scenario: Landing Page
    Then all the main navigation links yield expected landing pages

  @search
  Scenario:
    When I search for the following property
      |state                |       VIC          |
      |suburb               |       Richmond     |
      |property type        |       Apartment    |
      |max price            |       500,000      |
    Then the results page shows the results for 'VIC' and 'Richmond'
    Then all the listings match the State and Suburb



