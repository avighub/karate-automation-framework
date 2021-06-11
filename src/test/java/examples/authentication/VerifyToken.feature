Feature: Verify token and refresh token generation
#
#Background: 
#	* configure headers = read()
	
@generateToken
Scenario: Generate access token using valid Email,Password and grant_type as password
 	Given url BaseURL + '/api/v1/token'
	And header Content-Type = 'application/x-www-form-urlencoded'
	And form field username = username
	And form field password = password
	And form field grant_type = 'password'
	And request {}
 	When method post
 	Then status 200 
 	And def tokenType = $.token_type
 	And match tokenType == 'bearer'
 	And def expiry = $.expires_in
 	And match expiry == 1799
 	
 