# Demo: Simple GET and POST method using simple assertion
Feature: To Test GET and POST methods

  # Everything written in background section will be run before each scenario

  @sanity
  Scenario: Test GET method
    #Given def decoded = java.net.URLDecoder.decode (encoded, 'UTF-8')
    Given def encoded = 'Tenants,Forma,Produtos'
    And print encoded
