@ready @list_stockunit @stockunit @debug
Feature: Endpoint Aldebaran StockUnits

###############################################################################
#   GET: Aldebaran-Stock /aldebaran-stockunit/stockunits/stockunit-id
###############################################################################

@run_10_times @done
Scenario: GET Compare Aldebaran body responses with database
	When  get in stockUnit in Server for Id with "valid" user
	Then  Response code should be equal "200"
	And   Verify if the response contains the field X-tid
  Then  compare multiple id StockUnit response with database

@run_10_times
Scenario: Check StockUnit Id duplicate the response with database
  When get in stockUnit in Server for Id duplicate with "valid" user
	Then  Response code should be equal "200"
	And   Verify if the response contains the field X-tid
	Then  compare multiple id StockUnit response with database

@run_10_times
Scenario: Check StockUnit response with database querystring
	When get in stockUnit in Server for querystring with "valid" user
	Then  Response code should be equal "200"
	And   Verify if the response contains the field X-tid
	Then  compare multiple id StockUnit response with database

@run_10_times
Scenario: Check StockUnit response with database 'stockunits/<stockunit-id>'
	When  get in stockUnit with multiple StockUnit id with "valid" user
	Then  Response code should be equal "200"
	And   Verify if the response contains the field X-tid
	Then  compare multiple id StockUnit response with database

###############################################################################
#   GET: Negative Scenarios
#	Status Code
#   200	Sucesso; response body contendo Json de representação do recurso
#   400	Algum parâmetro com tipo inválido
#   401	Cliente não autenticado
#   404	Recurso não encontrado
#   405	Operação não suportada; Serviço suporta apenas GET
#   500	Erro interno (SIGE inacessível, etc.)
###############################################################################

Scenario: GET Status Code 400: Algum parâmetro com tipo inválido
	Given that I make a check in the estockUnit service with id invalid and "valid" user
	Then  Response code should be equal "400"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Bad Request"

Scenario: GET Status Code 401: Cliente não autenticado: wrong username
	Given that I make an consult in stockUnit service with "invalid_username"
	Then  Response code should be equal "401"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Bad credentials"

Scenario: GET Status Code 401: Cliente não autenticado: empty username
	Given that I make an consult in stockUnit service with "empty_username"
	Then  Response code should be equal "401"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Bad credentials"

Scenario: GET Status Code 401: Cliente não autenticado: wrong password
	Given that I make an consult in stockUnit service with "invalid_password"
	Then  Response code should be equal "401"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Bad credentials"

Scenario: GET Status Code 401: Cliente não autenticado: empty password
	Given that I make an consult in stockUnit service with "empty_password"
	Then  Response code should be equal "401"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Bad credentials"

Scenario: GET Status Code 404: Resource Not Found
	Given that I consult a id invalid in stockUnit server with "valid" user
	Then  Response code should be equal "404"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Resource not found"

###############################################################################
#   GET: Negative Scenarios
#   http://localhost:8080/aldebaran-stockunit/stockunits/?ean=7896525071471&plant=WM7&warrantyId=65&inventoryLocationId=25341384
#
#	Status Code
#   200	Sucesso; response body contendo Json de representação do recurso
#   400	Algum parâmetro com tipo inválido
#   401	Cliente não autenticado
#   404	Recurso não encontrado
#   405	Operação não suportada; Serviço suporta apenas GET
#   500	Erro interno (SIGE inacessível, etc.)
###############################################################################

Scenario: GET Status Code 400: Algum parâmetro com tipo inválido
	Given that I consult with some invalid parameter whit "valid" user
	Then  Response code should be equal "400"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Bad Request"

Scenario: GET Status Code 401: Cliente não autenticado: wrong username
	When get in stockUnit in Server for querystring with "invalid_username" user
	Then  Response code should be equal "401"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Bad credentials"

Scenario: GET Status Code 401: Cliente não autenticado: empty username
	When get in stockUnit in Server for querystring with "empty_username" user
	Then  Response code should be equal "401"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Bad credentials"

Scenario: GET Status Code 401: Cliente não autenticado: wrong password
	When get in stockUnit in Server for querystring with "invalid_password" user
	Then  Response code should be equal "401"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Bad credentials"

Scenario: GET Status Code 401: Cliente não autenticado: wrong empty
	When get in stockUnit in Server for querystring with "invalid_password" user
	Then  Response code should be equal "401"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Bad credentials"

Scenario: GET Status Code 404: Resource Not Found
	Given get in stockUnit server with querystring invalid and "valid" user
	Then  Response code should be equal "404"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Resource not found"

Scenario: GET Status Code 404: Sem o ean na querystring
	Given that I make a request in stockunit server without the parameter ean with "valid" user
	Then  Response code should be equal "404"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Resource not found"

Scenario: GET Status Code 404: Sem o plant na querystring
	Given that I make a request in stockunit server without the parameter plant with "valid" user
	Then  Response code should be equal "404"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Resource not found"

Scenario: GET Status Code 404: Sem o warrantyId na querystring
	Given that I make a request in stockunit server without the parameter warrantyId with "valid" user
	Then  Response code should be equal "404"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Resource not found"

Scenario: GET Status Code 404: Sem o inventoryLocationId na querystring
	Given that I make a request in stockunit server without the parameter inventoryLocationId with "valid" user
	Then  Response code should be equal "404"
	And   Verify if the response contains the field X-tid
	Then  I should see the message "Resource not found"
