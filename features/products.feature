@ready @products @debug
Feature: Endpoint Products

###############################################################################
#   Tests of Service Response x Database
###############################################################################
	@run_10_times
	Scenario: Compare aldebaran products with database for Id'
		Given GET SKU Id from database
		When  GET in product server for Id with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify product Response

	@run_10_times
	Scenario: Compare aldebaran body response for path 'products/<id>/manufacturers'
		Given GET SKU Id from database
		When  GET in product manufacturers server for Id with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify products response manufacturers

	@run_10_times
	Scenario: Compare aldebaran body response for path 'products/<id>/departments'
		Given GET SKU Id from database
		When  GET in product departments server for Id with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify products response departments

	@run_10_times
	Scenario: Compare aldebaran body response for path 'products/<id>/subdepartment'
		Given GET SKU Id from database
		When  GET in products subdepartment server for Id with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify products response subdepartment

  @run_10_times
	Scenario: Compare aldebaran body response for path 'products/<id>/suppliers'
		Given GET SKU Id from database
		When  GET in products suppliers server for Id with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify products response suppliers

	@run_10_times
	Scenario: Compare Lockdown body response for path 'products/<id>/suppliers/<cnpj>'
		Given GET SKU Id and CNPJ from database
		When  GET in products suppliers server for cnpj with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify products response suppliers_cnpj

# 	#### PAGE
	Scenario: Products: limit=null page=null
		When  GET in products suppliers server for id and limit null with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify products response suppliers for pages
		And Response should have at index zero link first with value "/aldebaran-products/products"
		And Response should have at index one link next with value "/aldebaran-products/products?page=2"

	Scenario: Products: limit=101 page=null
		When  GET in products server with higher than allowed "valid" user
		Then  Response code should be equal "422"
		Then  I should see the message "Unprocessable Entity"

	Scenario: Products: limit=1 page=1
		When  GET in products server for path "?limit=1&page=1" with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify products response suppliers for pages
		And Response should have at index zero link first with value "/aldebaran-products/products?limit=1"
		And Response should have at index one link next with value "/aldebaran-products/products?limit=1&page=2"

	Scenario: Products: limit=2 page=2
		When  GET in products server for path "?limit=2&page=1" with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify products response suppliers for pages
		And Response should have at index zero link first with value "/aldebaran-products/products?limit=2"
		And Response should have at index one link next with value "/aldebaran-products/products?limit=2&page=2"

	Scenario: Products: limit=1 page=null
		When  GET in products server for path "?limit=1" with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify products response suppliers for pages
		And Response should have at index zero link first with value "/aldebaran-products/products?limit=1"
		And Response should have at index one link next with value "/aldebaran-products/products?limit=1&page=2"

	Scenario: Products: limit=2 page=null
		When  GET in products server for path "?limit=2" with "valid" user
		Then  Response code should be equal "200"
		And   Verify if the response contains the field X-tid
		Then  Verify products response suppliers for pages
		And Response should have at index zero link first with value "/aldebaran-products/products?limit=2"
		And Response should have at index one link next with value "/aldebaran-products/products?limit=2&page=2"

# ##################################################################################
# ####  GET: Negative Scenarios
# ####	Status Code
# ####  400	Algum parâmetro com tipo inválido
# ####  401	Cliente não autenticado
# ####  404	Recurso não encontrado
# ####  405	Operação não suportada; Serviço suporta apenas GET
# ####  500	Erro interno (SIGE inacessível, etc.)
# ##################################################################################

	Scenario: GET Status Code 400: Algum parâmetro com tipo inválido "/products/wrong_parameter/manufacturers"
		When  GET in products server for path "/wrong_parameter/manufacturers" with "valid" user
		Then  Response code should be equal "400"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad Request"

	Scenario: GET Status Code 400: Algum parâmetro com tipo inválido "/products/wrong_parameter/departments"
		When  GET in products server for path "/wrong_parameter/departments" with "valid" user
		Then  Response code should be equal "400"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad Request"

	Scenario: GET Status Code 400: Algum parâmetro com tipo inválido "/products/wrong_parameter/subdepartment"
		When  GET in products server for path "/wrong_parameter/subdepartment" with "valid" user
		Then  Response code should be equal "400"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad Request"

	Scenario: GET Status Code 400: Algum parâmetro com tipo inválido "/products/wrong_parameter/suppliers"
		When  GET in products server for path "/wrong_parameter/suppliers" with "valid" user
		Then  Response code should be equal "400"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad Request"

	Scenario: GET Status Code 400: Algum parâmetro com tipo inválido "/products/wrong_parameter/suppliers/7722274000133"
		When  GET in products server for path "/wrong_parameter/suppliers/7722274000133" with "valid" user
		Then  Response code should be equal "400"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad Request"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong username "/products/<id>"
		Given GET SKU Id from database
		When  GET in product server for Id with "invalid_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: empty username "/products/<id>"
		Given GET SKU Id from database
		When  GET in product server for Id with "empty_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong password "/products/<id>"
		Given GET SKU Id from database
		When  GET in product server for Id with "invalid_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong empty "/products/<id>"
		Given GET SKU Id from database
		When  GET in product server for Id with "empty_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 404: Resource Not Found "/products/<id>"
		When  GET in products server for path "/0000" with "valid" user
		Then  Response code should be equal "404"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Resource not found"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong username "/products/<id>/manufacturers"
		Given GET SKU Id from database
		When  GET in product manufacturers server for Id with "invalid_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: empty username "/products/<id>/manufacturers"
		Given GET SKU Id from database
		When  GET in product manufacturers server for Id with "empty_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong password  "/products/<id>/manufacturers"
		Given GET SKU Id from database
		When  GET in product manufacturers server for Id with "invalid_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong empty  "/products/<id>/manufacturers"
		Given GET SKU Id from database
		When  GET in product manufacturers server for Id with "empty_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 404: Resource Not Found  "/products/<id>/manufacturers"
		When  GET in products server for path "/0000/manufacturers" with "valid" user
		Then  Response code should be equal "404"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Resource not found"

	# ##################################################################################

	Scenario: GET Status Code 401: Cliente não autenticado: wrong username "/products/<id>/departments"
		Given GET SKU Id from database
		When  GET in product departments server for Id with "invalid_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: empty username "/products/<id>/departments"
		Given GET SKU Id from database
		When  GET in product departments server for Id with "empty_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong password "/products/<id>/departments"
		Given GET SKU Id from database
		When  GET in product departments server for Id with "invalid_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong empty "/products/<id>/departments"
		Given GET SKU Id from database
		When  GET in product departments server for Id with "empty_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 404: Resource Not Found "/products/<id>/departments"
		When  GET in products server for path "/0000/departments" with "valid" user
		Then  Response code should be equal "404"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Resource not found"

	#################################################################################################################

	Scenario: GET Status Code 401: Cliente não autenticado: wrong username "/products/<id>/subdepartment"
		Given GET SKU Id from database
		When  GET in products subdepartment server for Id with "invalid_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: empty username "/products/<id>/subdepartment"
		Given GET SKU Id from database
		When  GET in products subdepartment server for Id with "empty_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong password "/products/<id>/subdepartment"
		When  GET in products subdepartment server for Id with "invalid_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong empty "/products/<id>/subdepartment"
		When  GET in products subdepartment server for Id with "empty_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 404: Resource Not Found "/products/<id>/subdepartment"
		When  GET in products server for path "/0000/subdepartment" with "valid" user
		Then  Response code should be equal "404"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Resource not found"

	#########################################################################################################################

	Scenario: GET Status Code 401: Cliente não autenticado: wrong username "/products/<id>/suppliers"
		Given GET SKU Id from database
		When  GET in products suppliers server for Id with "invalid_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: empty username "/products/<id>/suppliers"
		Given GET SKU Id from database
		When  GET in products suppliers server for Id with "empty_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong password "/products/<id>/suppliers"
		Given GET SKU Id from database
		When  GET in products suppliers server for Id with "invalid_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong empty "/products/<id>/suppliers"
		Given GET SKU Id from database
		When  GET in products suppliers server for Id with "empty_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 404: Resource Not Found "/products/<id>/suppliers"
		When  GET in products server for path "/0000/suppliers" with "valid" user
		Then  Response code should be equal "404"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Resource not found"

	#############################################################################################################################################

	Scenario: GET Status Code 401: Cliente não autenticado: wrong username "/products/4090/suppliers/40264616000275"
		Given GET SKU Id and CNPJ from database
		When  GET in products suppliers server for cnpj with "invalid_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: empty username "/products/4090/suppliers/40264616000275"
		Given GET SKU Id and CNPJ from database
		When  GET in products suppliers server for cnpj with "empty_username" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong password "/products/4090/suppliers/40264616000275"
		Given GET SKU Id and CNPJ from database
		When  GET in products suppliers server for cnpj with "invalid_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 401: Cliente não autenticado: wrong empty "/products/4090/suppliers/40264616000275"
		Given GET SKU Id and CNPJ from database
		When  GET in products suppliers server for cnpj with "empty_password" user
		Then  Response code should be equal "401"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Bad credentials"

	Scenario: GET Status Code 404: Resource Not Found "/products/4090/suppliers/40264616000275"
		When  GET in products server for path "/4090/suppliers/402646160002751" with "valid" user
		Then  Response code should be equal "404"
		And   Verify if the response contains the field X-tid
		Then  I should see the message "Resource not found"
