Feature: This feature contains all the examples and exercises for jsonpath

  Scenario: Playing with variables
    Given def var1 = "Hi"
    When print var1

  #Scenario: Reusing variable from other scenario
    Given var2='Avishek'
    Then print 'Reusable var=', var1
