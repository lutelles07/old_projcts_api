@ready @carriers_cutoffs @carriers
Feature: API Carriers Mega Route CutOffs
It provides API that allows the maintenance (inclusion, alteration and exclusion) of the Mega routes of the Carriers in the SIGE

  Scenario: Create a CultOffs
    When  I create a new mega route cutoffs in Aldebaran
    Then it will return code "201"
    And   Verify if the response contains the field X-tid

  Scenario: Update an existing mega route CutOffs
    When  I Update an existing mega route cutoffs in Aldebaran
    Then it will return code "200"
    And   Verify if the response contains the field X-tid
  Scenario: Delete an existing mega route CutOff

    When  I Delete an existing mega route cutoffs in Aldebaran
    And   Verify if the response contains the field X-tid
    Then it will return code "204"

    ###############################################################################
                      #  NEGATIVE SCENARIOS  #
    ###############################################################################

  Scenario: Post a request without the operationSection on the mega route CutOffs
    When  I make a request without the operationSection on the mega route cutoffs
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: Post a request without the carrierSection on the mega route CutOffs
    When  I make a request without the carrierSection on the mega route cutoffs
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: Post a request without the user on the mega route CutOffs
    When  I make a request without the user on the mega route cutoffs
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: Post a request without the dateTime on the mega route CutOffs
    When  I make a request without the dateTime on the mega route cutoffs
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: Post a request invalid the dateTime on the mega route CutOffs
    When  I make a request invalid the dateTime on the mega route cutoffs
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then I see the error message "Bad Request"

  Scenario: unauthorized request mega route CutOffs API
    When  I make an unauthorized request mega route cutoffs in Aldebaran
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I see the error message "Bad credentials"

  Scenario: Request not supported Service GET, mega route CutOffs API
    When  I make an not supported Service GET mega route cutoffs in Aldebaran
    Then  Response code should be equal "405"
    And   Verify if the response contains the field X-tid
    Then  I see the error message "Method Not Allowed"

  Scenario: Post an invalid value request in the operationsection on the CutOffs mega route
    When I make a request with an invalid value in the operationsection at the mega route cutoffs
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then I see the error code "103"

  Scenario: Post an invalid value request in the carriersection on the CutOffs mega route
    When I make a request with an invalid value in the carriersection at the mega route cutoffs
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then I see the error code "103"
  # @bug
  # Scenario: Post an invalid value request in the user on the CutOffs mega route
  #   When I make a request with an invalid value in the user at the mega route cutoffs
  #   Then  Response code should be equal "422"
  #   And   Verify if the response contains the field X-tid
  #   Then I see the error code "103"
  # @bug
  # Scenario: Post an invalid value request in the dateTime on the CutOffs mega route
  #   When I make a request with an invalid value in the datetime at the mega route cutoffs
  #   Then  Response code should be equal "422"
  #   And   Verify if the response contains the field X-tid
  #   Then I see the error code "103"
