@ready @returnitems
Feature: Endpoint Return Items

###############################################################################
#   GET: /returnitems/<estoque_id>
###############################################################################

	Scenario: GET Compare Lockdown body responses for path 'returnitems/id
		Given GET Estoque Id from database
		When do I make a query for an item in the return items api whit user "valid"
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  I valid response body by returnItems

# ###############################################################################
# #   GET: Negative Scenarios
#
# #	Status Code
# #   200	Sucesso; response body contendo Json de representação do recurso
# #   400	Algum parâmetro com tipo inválido
# #   401	Cliente não autenticado
# #   404	Recurso não encontrado
# #   405	Operação não suportada; Serviço suporta apenas GET
# #   500	Erro interno (SIGE inacessível, etc.)
# ###############################################################################

	Scenario: GET Status Code 400: Algum parâmetro com tipo inválido
		When do I make a query for an item invalid whit user "valid"
		Then  Response code should be equal "400"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad Request"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong username
		Given GET Estoque Id from database
		When I query for an item with the user "invalid_username"
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: empty username
		Given GET Estoque Id from database
		When I query for an item with the user "empty_username"
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong password
		Given GET Estoque Id from database
		When I query for an item with the user "invalid_password"
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong empty
		Given GET Estoque Id from database
		When I query for an item with the user "empty_password"
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 404: Resource Not Found
		When I query an item that does not exist with the "valid" user
		Then  Response code should be equal "404"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Resource not found"

# ###############################################################################
# #   PUT:  returnitems/<estoque_id>/warranties
# # 	#	Status Code
# #   204	Sucesso
# ###############################################################################

	Scenario: PUT: HTTP Status Code 204: Sucesso
		Given GET Estoque Id List from database
		Then do resquest put in aldebaran server the "valid" user
		Then  Response code should be equal "204"
		And   Verify if the response contains the field X-tid

###############################################################################
#   PUT: Negative Scenarios

#	Status Code
# 	400	Request inválida
# 	401	Cliente não autenticado
# 	405	Operação não suportada; Serviço suporta apenas PUT
# 	422	Códigos de erro da Procedure
# 	500	Erro interno (SIGE inacessível, etc.)
###############################################################################

	Scenario: PUT: HTTP Status Code 422: Message: Alteracao de restricao inocua
		Given GET Estoque Id List from database
		When I make an update in target Warranty with value repeated whit "valid" user
		Then  Response code should be equal "422"
		And   Verify if the response contains the field X-tid
		Then  Response body should have code with value "10"
		Then  I should see the message "prc_boomerang_sige - Problemas ao alterar restricao do item. ORA-20526: Alteracao de restricao inocua"

	Scenario: PUT: HTTP Status Code 422: Message: Formato invalido lendo etiqueta
		When I nake an update in targetWarranty with format invalid and "valid" user
		Then  Response code should be equal "422"
		And   Verify if the response contains the field X-tid
		Then  Response body should have code with value "3"
		Then  I should see the message "prc_boomerang_sige - Problemas ao decodificar estoque. ORA-20517: Formato invalido lendo etiqueta"

	Scenario: PUT: HTTP Status Code 422: Message: Warranty invalido
		Given GET Estoque Id List from database
		When I make an update in targetWarranty with value invalide and "valid" user
		Then  Response code should be equal "422"
		And   Verify if the response contains the field X-tid
		Then  Response body should have code with value "1"
		Then  I should see the message "prc_boomerang_sige - Problemas ao validar warranty. ORA-20498: Warranty invalido"

	Scenario: PUT: HTTP Status Code 400 : Message: Bad Request
		Given GET Estoque Id List from database
		When I update to targetWarranty with empty body and "valid" user
		Then  Response code should be equal "400"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad Request"

	Scenario: PUT : HTTP Status Code 401 : Message: Authentication Failed : username wrong
		Given GET Estoque Id List from database
		When I update the targetWarranty with "invalid_username"
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: PUT : HTTP Status Code 401 : Message: Authentication Failed : username empty
		Given GET Estoque Id List from database
		When I update the targetWarranty with "empty_username"
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: PUT : HTTP Status Code 401 : Message: Authentication Failed : password wrong
		Given GET Estoque Id List from database
		When I update the targetWarranty with "invalid_password"
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: PUT : HTTP Status Code 401 : Message: Authentication Failed : password empty
		Given GET Estoque Id List from database
		When I update the targetWarranty with "empty_password"
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"
