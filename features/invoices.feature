@ready @invoices
Feature: Endpoint Aldebaran Invoices

#***********************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @invoices --format html --out reports/invoices.html
#***********************************************************************************************************************

###############################################################################
#   GET: /aldebaran-invoices/invoices/{company}/{branch}/{invoice}/{serie} - GET
#         RUN 100 times - Test values with old Lockdown Service
###############################################################################
  @run_10_times
  Scenario: GET Compare Lockdown body responses for path "/invoices/<company_id>/<branch_id>/<invoice_id>/<serie_id>"
    Given GET Invoices Id from database
    When  GET in Invoices passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Compare Invoices service response with database

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
    Given GET Invoices Id from database
    When  GET in Invoices by the field companyid equal "0", branchid equal "aaa", invoiceid equal "aaa", serieid equal "a" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    Given GET Invoices Id from database
    When  GET in Invoices passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    Given GET Invoices Id from database
    When  GET in Invoices passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    Given GET Invoices Id from database
    When  GET in Invoices passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    Given GET Invoices Id from database
    When  GET in Invoices passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


  Scenario: GET Status Code 404: Resource Not Found
    Given GET Invoices Id from database
    When  GET in Invoices by the field companyid equal "0", branchid equal "0", invoiceid equal "0", serieid equal "0" passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Resource not found"