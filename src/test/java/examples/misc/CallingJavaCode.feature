Feature: Java Code

  Background: 
    * def doWork =
      """
      function(arg) {
        var JavaDemo = Java.type('com.misc.JavaDemo');
        var jd = new JavaDemo();
        return jd.doWork(arg);  
      }
      """

  Scenario: Calling Java code For positive case
    * def result = call doWork 'world'
    * match result == { someKey: 'hello world' }
    # using a static method - observe how java interop is truly seamless !
    * def JavaDemo = Java.type('com.misc.JavaDemo')
    * def result = JavaDemo.doWorkStatic('world')
    * assert result == 'hello world'

  Scenario: Calling Java code for Negative case
    * def result = call doWork 'world'
    * match result == { someKey: 'hello world' }
    # using a static method - observe how java interop is truly seamless !
    * def JavaDemo = Java.type('com.misc.JavaDemo')
    * def result = JavaDemo.doWorkStatic('Invalid')
    * assert result == 'hello world'
