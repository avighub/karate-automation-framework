# Demo: Simple GET and POST method using simple assertion
Feature: To Test GET and POST methods

  # Everything written in background section will be run before each scenario
  Background: 
#    * configure proxy = 'proxyUrl'

  @sanity
  Scenario: Test GET method
    # URL can be passed as a variable from karate-config file
    Given url 'https://gorest.co.in/public-api/users'
    When method get
    Then status 200
    # Assertion with slice of json
    And match response._meta contains { "success": true }
    #Assertion using Fuzzy match
    And match response._meta contains {"totalCount":"#ignore"}

  @regression
  Scenario: Test POST method
    Given url 'https://gorest.co.in/public-api/users'
    And header Content-Type = 'application/json'
    And request { "first_name": "TestUser3", "last_name": "Test","email": "setestuser3@example.com"}
    When method post
    Then status 200
    # Assetion using jsonPath / RegEx
    And match response._meta.success == true
