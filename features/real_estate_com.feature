@real_estate_com_au
Feature: Verify integrity of a real estate web site
  As a person demonstrating the use of Cucumber in a Ruby environment
  I want to provide some good examples of technique
  So that others may emulate or use as examples

  @nav
  Scenario: Landing Page
    Then all the main navigation links yield expected landing pages

  @search
  Scenario:
    Build a Test that performs a search meeting the following criteria.
    When I search for the following property
      |state                |       VIC          |
      |suburb               |       Richmond     |
      |property type        |       Flat         |
      |max price            |       500,000      |
    Then all the listings match the State and Suburb



