Feature: Generate Authentication token to reuse

  Scenario: Generate Auth token using valid credentials
    Given url BaseURL + '/api/v1/token'
    And header Content-Type = 'application/x-www-form-urlencoded'
    * form field username = username
    * form field password = password
    * form field grant_type = 'password'
    * request {}
    When method post
    Then status 200
    And match response contains { token_type: 'bearer' }
    * match response contains { expires_in: 1799 }
    * def authToken = response.access_token
    * print 'Token:' , authToken
