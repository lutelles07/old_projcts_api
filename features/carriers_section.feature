@carriers_sections @ready @carriers
Feature: API Carriers Sections
It provides API that allows maintenance (inclusion and modification) of cuts to mega delivery routes in SIGE
  @sections
  Scenario: Post a new mega route section
    When  I create a new mega route section in Aldebaran
    And   Verify if the response contains the field X-tid
    Then it will return code "201"

  Scenario: Post two new mega route section
    When  I create two new mega route section in Aldebaran
    And   Verify if the response contains the field X-tid
    Then it will return code "201"

  Scenario: Update an existing mega route section
    When  I update an existing mega route section in Aldebaran
    And   Verify if the response contains the field X-tid
    Then it will return code "200"

###############################################################################
                  #  NEGATIVE SCENARIOS  #
###############################################################################

  Scenario: Post a request without the sectionCode on the mega route section
    When  I make a request without the sectionCode on the mega route section
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: Post a request without the name on the mega route section
    When  I make a request without the name on the mega route section
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: Updade a request without the name on the mega route section
    When  I update an request without the name on the mega route section
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: Post unauthorized request mega route section API
    When  I make an unauthorized request mega route section in Aldebaran
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I see the error message "Bad credentials"

  Scenario: Update unauthorized request mega route section API
    When  I make update an unauthorized request mega route section in Aldebaran
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I see the error message "Bad credentials"

  Scenario: Request not supported Service GET, mega route section API
    When  I make an not supported Service GET mega route section in Aldebaran
    Then  Response code should be equal "405"
    And   Verify if the response contains the field X-tid
    Then  I see the error message "Method Not Allowed"

  Scenario: Post a request duplicate information on the mega route section api
    When  I request duplicate information on the mega route section
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then I see the error code "102"

  Scenario: Post a request for information with a number of characters above the allowed in the section of mega route api
    When  I request for information with a number of characters above the allowed in the mega route section
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then I see the error code "103"
