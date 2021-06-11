Feature: To Test MOCK

  Background:
#    * def baseurl = mock_misc
    * configure report = { showLog: true, showAllSteps: true }

  @regression
  Scenario: Test Mock GET method
    # URL can be passed as a variable from karate-config file
    Given url mock_misc
    When method get
    Then status 200
    * print 'RESPONSE: ', response
    * print 'EXTRACTED RESP', response.ClientMeetings