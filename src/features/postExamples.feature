Feature: Post requests

  Background:
    * url 'https://petstore.swagger.io/v2'

  @POST @createPet @regression
  Scenario: Successful pet create with reading file

    * def requestBody = read('classpath:playload.json')
    * requestBody.category.id = 01
    * requestBody.category.name = 'dog'
    * requestBody.name = 'duman'
    * requestBody.status = 'sold'

    Given path '/pet'
    And request requestBody
    And header content-type = 'application/json'
    When method POST
    Then status 200
    Then print 'response------',response

  @POST @regression
  Scenario: Successful pet create
    * def requestBody =
      """
      {
      "id": 25,
      "category": {
          "id": 2,
          "name": "dog"
      },
      "name": "doggie",
      "tags": [
          {
              "id": 0,
              "name": "sivas"
          }
      ],
      "status": "available"
      }
      """
    Given path '/pet'
    And request requestBody
    And header content-type = 'application/json'
    When method POST
    Then status 200
    Then print 'response------',response

  @POST @regression
  Scenario: Successful pet create with reading file and function

    * def requestBody = read('classpath:playload.json')
    * requestBody.name = 'duman'
    * def myJSFun =
    """
    function(arg){
      return arg.length
    }
    """
    * def postedLength = call myJSFun requestBody.name

    Given path '/pet'
    And request requestBody
    And header content-type = 'application/json'
    When method POST
    Then status 200
    * def responseLength = call myJSFun $.name
    Then  match postedLength == responseLength