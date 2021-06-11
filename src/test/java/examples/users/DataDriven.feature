Feature: To Test Data driven feature

  # Everything written in background section will be run before each scenario
  Background:
    * url BaseURL
#    * configure proxy = 'proxyUrl'

  Scenario Outline: Test with Examples
    Given path '/users'
    * param page = 2
    When method get
    Then status 200
    # Using jsonPath / RegEx with Variables
    And def email = karate.jsonPath(response,"$.data[?(@.id==7)].email")
    And print 'email:', email[0]
    And match email[0] == '<email>'

    Examples:
      | id | email                    |
      | 1  | michael.lawson@reqres.in |

  Scenario Outline: Test with csv
    Given path '/users'
    When method get
    Then status 200
    And match response._meta contains { "success": true }
    # Using jsonPath / RegEx with Variables
    And def firstName = karate.jsonPath(response,"$.result[?(@.id=='<id>')].first_name")
    And print 'firstName:', firstName[0]
    And match firstName[0] == '<first_name>'

    Examples:
      | read('classpath:com/se/KarateDemo/TestData_users.csv') |
