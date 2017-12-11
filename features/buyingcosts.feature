@ready @buyingcosts
Feature: Endpoint Aldebaran Buyingcosts

#*********************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @buyingcosts  --format html --out reports/buyingcosts.html
#*********************************************************************************************************

###############################################################################
#   GET: /aldebaran-buyingcosts/buyingcosts/{planta}/{sku} - GET
#       RUN 100 times - Test values with old Lockdown Service
###############################################################################
  @run_20_times
  Scenario: GET Compare Lockdown body responses for path "/buyingcosts/<planta_id>/<sku_id>"
    Given GET Buyingcosts Id from database
    When  GET in Buyingcosts by id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Compare Buyingcosts service response with database


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
    Given GET Buyingcosts Id from database
    When  GET in Buyingcosts by the field planta-id equal "planta" with the field equal "sky" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    Given GET Buyingcosts Id from database
    When  GET in Buyingcosts by id passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    Given GET Buyingcosts Id from database
    When  GET in Buyingcosts by id passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    Given GET Buyingcosts Id from database
    When  GET in Buyingcosts by id passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    Given GET Buyingcosts Id from database
    When  GET in Buyingcosts by id passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 404: Resource Not Found
    Given GET Buyingcosts Id from database
    When  GET in Buyingcosts by the field planta-id equal "0" with the field equal "0" passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Resource not found"