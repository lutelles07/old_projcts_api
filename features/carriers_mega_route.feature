@carriers_mega_route @ready @carriers
Feature: API Carriers Mega Route
It provides API that allows the maintenance (inclusion, alteration and exclusion) of the Mega routes of the Carriers in the SIGE

  Scenario: Post a new mega route
    When  I create a new mega route in Aldebaran
    Then it will return code "201"
    And   Verify if the response contains the field X-tid
    Then  I check if the response body contain the message "Mega Rota incluída com sucesso"

  Scenario: Update an existing mega route
    When  I Update an existing mega route in Aldebaran
    Then it will return code "200"
    And   Verify if the response contains the field X-tid
    Then  I check if the response contain the message "Mega Rota alterada com sucesso"

  Scenario: Delete an existing mega route
    When  I Delete an existing mega route in Aldebaran
    And   Verify if the response contains the field X-tid
    Then it will return code "204"

###############################################################################
                  #  NEGATIVE SCENARIOS  #
###############################################################################
  Scenario: Post a request without the ID on the mega route
    When  I make a request without the ID on the mega route
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then I see the error code "103"

  Scenario: Post a request without the name on the mega route
    When  I make a request without the name on the mega route
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: Post a request without the externalDelivery on the mega route
    When  I make a request without the externalDelivery on the mega route
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: Post a request without the absenceRegion on the mega route
    When  I make a request without the absenceRegion on the mega route
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: Post a request without the sectionId on the mega route
    When  I make a request without the sectionId on the mega route
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: unauthorized request mega route API
    When  I make an unauthorized request mega route in Aldebaran
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I see the error message "Bad credentials"

  Scenario: Request not supported Service GET, mega route API
    When  I make an not supported Service GET mega route in Aldebaran
    Then  Response code should be equal "405"
    And   Verify if the response contains the field X-tid
    Then  I see the error message "Method Not Allowed"
