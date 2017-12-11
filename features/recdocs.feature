@ready @recdocs
Feature: Endpoint RecDocs

###############################################################################
#   GET: /aldebaran-recdocs/recdocs/<recdoc_id>
###############################################################################

  Scenario: GET HTTP Status 200: Sucesso: response body with Json of the resource
    Given RecDoc-id is equal "99"
    When  GET in RecDoc with X-tid "ba43y61m3mnbbzjnq21v00kit" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid with rigth value
    Then Response body should have right json schema for "recdocs"

#################################################################################
### GET: RUN 50 times - Test values with with database
#################################################################################
  @run_50_times
  Scenario: Check RecDocs response with database "/recdocs/<id>"
    Given GET RecDoc Id from database
    When  GET in RecDocs by recdoc-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Compare RecDocs service response with database

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
    Given RecDoc-id is equal "aaaaaaa"
    When  GET in RecDocs by recdoc-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    Given GET RecDoc Id from database
    When  GET in RecDocs by recdoc-id passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    Given GET RecDoc Id from database
    When  GET in RecDocs by recdoc-id passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    Given GET RecDoc Id from database
    When  GET in RecDocs by recdoc-id passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    Given GET RecDoc Id from database
    When  GET in RecDocs by recdoc-id passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 404: Resource Not Found
    Given RecDoc-id is equal "1999999999"
    When  GET in RecDocs by recdoc-id passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Resource not found"
