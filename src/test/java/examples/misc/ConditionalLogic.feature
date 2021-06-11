Feature: Working with Conditions

  Scenario: If Else and Count
  * def response = [{ "country": "CN","tnc_version": 1 },{ "country": "CN", "tnc_version": 2 } ]
  * print response 
  * def tnc_version = $response.[*].tnc_version
  * print 'tnc_version',tnc_version
  * def tcount = karate.sizeOf(tnc_version)
  * print 'T Count ',tcount
  * def tccount = tcount > 1 ? tcount-1 : 0  
  # Convert Float to Integer
  * print 'T Count2 ',~~tccount // double tiled converts float to integer
  * print 'Highest version=',tnc_version[tccount]
  
