Feature: Demonstrate Cucumber from python to work with a mail sending api
  As a person demonstrating the use of Cucumber in a Python environment
  I want to provide some good examples of technique
  So that others may emulate or use as examples

  Scenario: Send mail using the sendgrid api
    Given I send an email from sendgrid
    Then an email should have been sent
