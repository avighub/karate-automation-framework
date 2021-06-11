Feature: This feature contains all the examples and exercises for jsonpath

  #Scenario: Working with JSON Object and Print
  #* def response = { "requests": [ { "id": "myid", "friendlyId": "OR001608", "roleId": "Software Engineer", "roleName": "Software Engineer", "location": { "id": "###", "name": "#######" }, "hiringManager": { "ed": "####", "firstName": "######", "lastName": "######", "email": "##############" }}] }
  #* print response // Print supports only javascript on right-hand-side, not jsonpath or karate expression
  #* def temp3 = $.requests[?(@.friendlyId=='OR001608')].id
  #* print 'temp3-1:', temp3  				// It will return and array of all values of it has multiple
  #* print 'temp3-2:', temp3[*] 		// This will not work as it does not support wild card
  #* print 'temp3-3:', temp3[0] 		// It will return as per the index
  #Scenario: Working with JSON Array
  #* def response = [ { "active": true,"client_id": "demo"},{"active": false,"client_id": "demo"} ]
  #* print response
  #* match $[*].active == [ true,false ]
  #* def cid = $[*].active
  #* print 'Client_id: ', cid
  
  #Scenario: JSON Filter with Array
  #* def response = [ { "active": true,"client_id": "demo1","path":"http://path1"},{"active": false,"client_id": "demo2","path":"http://path2"} ]
  #* print response
  #* match $.[?(@.client_id=='demo1')].path == ["http://path1"]
  #* def path = $.[?(@.client_id=='demo1')].path
  #* def cid = karate.jsonPath(response,'$[*].client_id') // This is useful for both jsonpath and dynamic values using ( # )
  #* print 'Client_id= ', cid
  #* print 'path= ', path
  #* print 'path= ', path[0]
  
  #Scenario: JSON path with Dynamic values
  #* def response = { "requests": [ { "id": "myid", "friendlyId": "OR001608", "roleId": "Software Engineer", "roleName": "Software Engineer", "location": { "id": "###", "name": "#######" }, "hiringManager": { "ed": "####", "firstName": "######", "lastName": "######", "email": "##############" }}] }
  #* print response
  #* def ORID = 'OR001608'
  #* def temp3 = karate.jsonPath(response, "$.requests[?(@.friendlyId == '" + ORID + "')].id")
  #* print 'temp3:', temp3[0]
  #Scenario: Using variable in jsonpath
    #* def response = [ { "﻿cid" : "my-nova-buddy", "idms_client_id": "", "country": "EG",    "app_version": "V3.5",    "pdf_document": "NA", "document": "text" } ]
    #* def var1 = $[*].cid
    #* print 'var1=',var1
    #* def var2 = karate.jsonPath(response,"$.[?(@.cid=='" + var1 + "')].active") // Use karate.jsonPath(response,"jsonpath") to use variable
    #* print 'Value=',var2[0]
  Scenario: Playing with Float and Integers
  * def varFloat = 10.20
  * def varFloat2 = 10.0
  * def valFloat3 = 10.00
  * match varFloat == 10.20
  * match varFloat2 == 10
  * def varStringNum = '20.01'
  * match varStringNum == '20.01'
  
  # Scenario: Treat Json object as String
  * def jsonob = 'test'
  * match <jsonb> == 'test'
