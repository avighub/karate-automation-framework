Feature: To Compare jsons

  Scenario: Test json compare
    *  def source = read('source.json')
    * def dest = read('dest.json')
    * match source == dest