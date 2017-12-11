@ready @instances
Feature: Endpoint Aldebaran Instance

#*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @instances --format html --out reports/instances.html
#*************************************************************************************************************

###############################################################################
# GET: /Aldebaran-Instance/instances/<instance-id>
#   RUN 10 times - Test values with database
###############################################################################
  @run_10_times
  Scenario: GET Instance for path 'instances/<instance-id>'
    Given GET Instance Id from database
    When  GET in Instance by instance-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Compare the responses with database

###############################################################################
#   GET: Negative Scenarios
#------------------------------------------------------------------------------
#	Status Code
#   200	Sucesso; response body contendo Json de representação do recurso
#   400	Algum parâmetro com tipo inválido
#   401	Cliente não autenticado
#   404	Recurso não encontrado
#   405	Operação não suportada; Serviço suporta apenas GET
#   500	Erro interno (SIGE inacessível, etc.)
###############################################################################

  Scenario: GET Status Code 400: Algum parâmetro com tipo inválido
    Given GET Instance Id from database
    When  GET in Instance by the field instance-id equal "aaaa" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    Given GET Instance Id from database
    When  GET in Instance by instance-id passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    Given GET Instance Id from database
    When  GET in Instance by instance-id passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    Given GET Instance Id from database
    When  GET in Instance by instance-id passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    Given GET Instance Id from database
    When  GET in Instance by instance-id passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 404: Resource Not Found
    Given GET Instance Id from database
    When  GET in Instance by the field instance-id equal "1999999999" passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Resource not found"

###############################################################################
# POST: aldebaran-instances/instances/{id}/messageparameters
###############################################################################

  Scenario: POST (15 occurs in the body) - Status Code 200: Success
    Given GET Instance Id from database
    Given that the body has "15" valid names which were acquired from database
    When  POST in Instance by instance-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Validate post response with database


  Scenario: POST (1 occur in the body) - Status Code 200: Success
    Given GET Instance Id from database
    Given that the body has "1" valid names which were acquired from database
    When  POST in Instance by instance-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Validate post response with database


  Scenario: POST (1 occur in the body with an invalid "name") - Status Code "404": Resource not found
    Given GET Instance Id from database
    Given that the body has "1" valid names which were acquired from database
    When  inputing an invalid name equal "#SDDD"
    When  POST in Instance by instance-id passing a "valid" authentication
    Then  Response code should be equal "404"
    Then  I should see the message "Resource not found"


  Scenario: POST (15 occurs in the body with only an invalid "name") - Status Code "200": Success
    Given GET Instance Id from database
    Given that the body has "15" valid names which were acquired from database
    When  inputing an invalid name equal "#SDDD"
    When  POST in Instance by instance-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Validate post response with database


  Scenario: POST with a invalid instance-ID in the URL - Status Code 200: Success
    Given GET Instance Id from database
    Given that the body has "15" valid names which were acquired from database
    When  inputting an invalid IDinstance equal "1234"
    When  POST in Instance by instance-id passing a "valid" authentication
    Then  Response code should be equal "404"
    Then  I should see the message "Resource not found"
