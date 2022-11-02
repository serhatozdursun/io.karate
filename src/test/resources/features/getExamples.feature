Feature: Get requests

  Background:
    * url 'https://petstore.swagger.io/v2'


  @GET @regression
  Scenario Outline: Check http 200
    Given  path '/pet/findByStatus'
    And param status = <status>
    When method GET
    Then status 200
    Then print 'response----',response
    Examples:
      | status      |
      | 'pending'   |
      | 'sold'      |
      | 'available' |



  @GET @regression
  Scenario: Get user
    Given path '/user/login'
    And param username = 'Serhat'
    And param password = '1234RY'
    When method GET
    Then status 200
    Then match $.code == 200
    Then match $.message contains 'logged in user session'
    Then match $.type == 'unknown'
    Then assert responseTime < 1000
    Then print 'response----',response


  @GET @regression
    Scenario: Get posted pet
      * def petPostScenario = read('postExamples.feature@createPet')
      * def result = call petPostScenario
      * def petId = result.response.id
      * def patName = result.requestBody.name

      Given path '/pet/',petId
      When method GET
      Then status 200
      Then match $.name == patName
    Then print 'response----',response




