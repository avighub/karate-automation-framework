Feature: To Test Report

  Background:
#    * def baseurl = mock_misc
    * configure report = { showLog: true, showAllSteps: true }

  @report
  Scenario: Test report logging
    # URL can be passed as a variable from karate-config file
    Given url mock_misc
    When method get
    Then status 200
    * print 'RESPONSE: ', response
    * print 'EXTRACTED RESP', response.ClientMeetings