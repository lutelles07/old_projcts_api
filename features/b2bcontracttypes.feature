@ready @b2bcontracttypes
Feature: Endpoint Aldebaran B2BContractTypes

###############################################################################
#   GET: /aldebaran-b2bcontracttypes/b2bcontracttypes/{contract-type} - GET
###############################################################################

 Scenario: GET B2BContractTypes for path "/b2bcontracttypes/billingtypes"
   When  GET in B2BContractTypes for "billingtypes" passing a "valid" authentication
   Then  Response code should be equal "200"
   And   Verify if the response contains the field X-tid

 Scenario: GET B2BContractTypes for path "/b2bcontracttypes/shippingcategories"
   When  GET in B2BContractTypes for "shippingcategories" passing a "valid" authentication
   Then  Response code should be equal "200"
   And   Verify if the response contains the field X-tid

 Scenario: GET B2BContractTypes for path "/b2bcontracttypes/paymentmethods"
   When  GET in B2BContractTypes for "paymentmethods" passing a "valid" authentication
   Then  Response code should be equal "200"
   And   Verify if the response contains the field X-tid

 Scenario: GET B2BContractTypes for path "/b2bcontracttypes/saleschannels"
   When  GET in B2BContractTypes for "saleschannels" passing a "valid" authentication
   Then  Response code should be equal "200"
   And   Verify if the response contains the field X-tid

##################################################################################
#   GET: Test values with data from database
##################################################################################

  Scenario: Check B2BContractTypes response with database '/b2bcontracttypes/billingtypes'
    Given GET Aldebaran-B2BContractTypes "billingtypes" from database
    When  GET in B2BContractTypes for "billingtypes" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Compare B2BContractTypes service response with database

  Scenario: Check B2BContractTypes response with database '/b2bcontracttypes/shippingcategories'
    Given GET Aldebaran-B2BContractTypes "shippingcategories" from database
    When  GET in B2BContractTypes for "shippingcategories" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Compare B2BContractTypes service response with database

  Scenario: Check B2BContractTypes response with database '/b2bcontracttypes/paymentmethods'
    Given GET Aldebaran-B2BContractTypes "paymentmethods" from database
    When  GET in B2BContractTypes for "paymentmethods" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Compare B2BContractTypes service response with database

  Scenario: Check B2BContractTypes response with database '/b2bcontracttypes/saleschannels'
    Given GET Aldebaran-B2BContractTypes "saleschannels" from database
    When  GET in B2BContractTypes for "saleschannels" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Compare B2BContractTypes service response with database


##################################################################################
####  GET: Negative Scenarios
##################################################################################
####	Status Code
####  200	Sucesso; response body contendo Json de representação do recurso
####  400	Algum parâmetro com tipo inválido
####  401	Cliente não autenticado
####  404	Recurso não encontrado
####  405	Operação não suportada; Serviço suporta apenas GET
####  500	Erro interno (SIGE inacessível, etc.)
##################################################################################

  Scenario: GET Status Code 400: Algum parâmetro com tipo inválido "/b2bcontracttypes/qweqwe"
    When  GET in B2BContractTypes for "qweqwe" passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Not Found"

  Scenario: GET Status Code 401: Cliente não autenticado: invalid username "/b2bcontracttypes/billingtypes"
    When  GET in B2BContractTypes for "billingtypes" passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: empty username "/b2bcontracttypes/billingtypes"
    When  GET in B2BContractTypes for "billingtypes" passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: invalid username "/b2bcontracttypes/billingtypes"
    When  GET in B2BContractTypes for "shippingcategories" passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: empty username "/b2bcontracttypes/billingtypes"
    When  GET in B2BContractTypes for "shippingcategories" passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: invalid username "/b2bcontracttypes/paymentmethods"
    When  GET in B2BContractTypes for "paymentmethods" passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: empty username "/b2bcontracttypes/paymentmethods"
    When  GET in B2BContractTypes for "paymentmethods" passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: invalid username "/b2bcontracttypes/paymentmethods"
    When  GET in B2BContractTypes for "saleschannels" passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: empty username "/b2bcontracttypes/paymentmethods"
    When  GET in B2BContractTypes for "saleschannels" passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"
