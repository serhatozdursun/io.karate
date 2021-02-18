Feature: Soap examples

  Background:
    * url 'http://www.dneonline.com/calculator.asmx'

  @SOAP @regression
  Scenario Outline: soap 1.1 example
    * def requestBody =
    """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <Add xmlns="http://tempuri.org/">
          <intA><initA></intA>
          <intB><initB></intB>
        </Add>
      </soap:Body>
    </soap:Envelope>
    """
    Given request requestBody
    When soap action 'http://tempuri.org/Add'
    Then status 200
    * def result = <initA>+<initB>
    Then match /Envelope/Body/AddResponse/AddResult == result
    Then print response
    Examples:
      | initA | initB |
      | 3     | 2     |
      | 4     | 4     |
      | 2     | 5     |


  @SOAP @regression
  Scenario: soap 1.1 example with xml file
    * def requestBody = read('classpath:soapBody.xml')

    Given request requestBody
    When soap action 'http://tempuri.org/Add'
    Then status 200
    Then match /Envelope/Body/AddResponse/AddResult == 5
    Then print response
