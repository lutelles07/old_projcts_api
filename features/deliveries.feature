@ready @delivery
Feature: Endpoint Aldebaran Deliveries

#*********************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @deliveries  --format html --out reports/deliveries.html
#*********************************************************************************************************

###############################################################################
#   GET: /aldebaran-delivery/deliveries/<company-id>/<delivery-id>
#         RUN 10 times - Test values
###############################################################################
  @run_10_times
  Scenario: GET Status Code 200: Success
    Given GET Delivery Id from database
    When  GET in Delivery by id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Compare Delivery service response with database


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
    Given GET Delivery Id from database
    When  GET in Delivery by the field delivery-id equal "aaaa" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    Given GET Delivery Id from database
    When  GET in Delivery by id passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    Given GET Delivery Id from database
    When  GET in Delivery by id passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    Given GET Delivery Id from database
    When  GET in Delivery by id passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    Given GET Delivery Id from database
    When  GET in Delivery by id passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 404: Resource Not Found
    Given GET Delivery Id from database
    When  GET in Delivery by the field delivery-id equal "1999999999" passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Resource not found"
