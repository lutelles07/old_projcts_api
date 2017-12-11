@ready @goodsreceivednotes @debug
Feature: Endpoint Aldebaran GoodsReceivedNotes

#***********************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @goodsreceivednotes --format html --out reports/goodsreceivednotes.html
#***********************************************************************************************************************

###############################################################################
#  GET: /aldebaran-GoodsReceivedNotes/GoodsReceivedNotes/items?startDate=<start_date>&endDate=<end_date> - GET
#           RUN 100 times - Test values with old Lockdown Service
###############################################################################
  @run_20_times
  Scenario: GET Compare Lockdown body responses for path "/items?startDate=<start_date>&endDate=<end_date>"
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by Dates passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid

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

  Scenario: GET Status Code 400: Algum parâmetro com tipo inválido: wrong date format
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by the field STARTDATE equal "20160125T00:00:01" with the field ENDDATE equal "20160125T23:59:59" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad request"


  Scenario: GET Status Code 400: Algum parâmetro com tipo inválido: 'startDate' is not present
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by the field STARTDATE equal "empty" with the field ENDDATE equal "empty" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Required String parameter 'startDate' is not present"


  Scenario: GET Status Code 400: Algum parâmetro com tipo inválido: 'startDate' is not present
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by the field STARTDATE equal "empty" with the field ENDDATE equal "2016-12-16T00:00:01" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Required String parameter 'startDate' is not present"


  Scenario: GET Status Code 400: Algum parâmetro com tipo inválido: 'endDate' is not present
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by the field STARTDATE equal "2016-12-16T00:00:01" with the field ENDDATE equal "empty" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Required String parameter 'endDate' is not present"


  Scenario: GET Status Code 400: Algum parâmetro com tipo inválido: startDate greather than endDate
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by the field STARTDATE equal "2016-12-16T00:00:01" with the field ENDDATE equal "2016-12-15T00:00:01" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad request"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by Dates passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by Dates passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by Dates passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"


  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by Dates passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"


  Scenario: GET Status Code 404: Resource Not Found
    Given GET in GoodsReceivedNotes Id from database
    When  GET in Goodsreceivednotes by the field STARTDATE equal "2014-12-16T00:00:01" with the field ENDDATE equal "2014-12-16T23:59:59" passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Resource not found"
