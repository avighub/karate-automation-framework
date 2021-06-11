# Demo: Simple GET and POST method using variables
Feature: To Test GET and POST methods

  # Everything written in background section will be run before each scenario
  Background: 
    * url BaseURL
    * header Authorization = AuthToken
    * configure proxy = 'proxy.com'

  @regression
  Scenario: Test GET method
    # URL can be passed as a variable from karate-config file
    Given path '/users'
    When method get
    Then status 200
    And match response._meta contains { "success": true }

  @sanity
  Scenario: Test POST method
    Given path '/users'
    And header Content-Type = 'application/json'
    And def RequestBody = read('CreateUserRequest.json')
    And print RequestBody
    # Passing json as Body
    And request RequestBody
    When method post
    Then status 200
    # Assetion using jsonPath / RegEx
    And match response._meta.success == false
