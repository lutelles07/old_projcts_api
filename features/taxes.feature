@ready @taxes
Feature: Endpoint Aldebaran Taxes

#*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @taxes --format html --out reports/taxes.html
#*************************************************************************************************************

###############################################################################
# GET: /aldebaran-taxes/v2/taxes
###############################################################################
  @run_10_times
  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes'
    When  GET in Taxes passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Should show the default limit which is "50"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
###############################################################################
  @run_10_times
  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes/idcia/idfilial/idsku'
    When  GET in Taxes passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid

#-----------------------------------------------------------------------------
# IN STAGE ENVIRONMENT IS DISPLAYED THE MESSAGE "N¿O EXISTEM DADOS PARA SEREM RETORNADOS" - ENCODING ISSUE
###############################################################################
#  GET: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
#-----------------------------------------------------------------------------
#                         INVALID IDCIA
###############################################################################

  Scenario: GET Status Code 404: invalid IDCIA for path '/aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}'
    When  GET in Taxes passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details with an invalid "idcia" passing a "valid" authentication
    Then  Response code should be equal "404"
#    And  I should see the message "NÃO EXISTEM DADOS PARA SEREM RETORNADOS"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
#-----------------------------------------------------------------------------
#                         INVALID IDFILIAL
###############################################################################

  Scenario: GET Status Code 404: invalid IDFILIAL for path '/aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}'
    When  GET in Taxes passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details with an invalid "idfilial" passing a "valid" authentication
    Then  Response code should be equal "404"
#    And  I should see the message "NÃO EXISTEM DADOS PARA SEREM RETORNADOS"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
#-----------------------------------------------------------------------------
#                         INVALID IDSKU
###############################################################################

  Scenario: GET Status Code 404: invalid IDSKU for path '/aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}'
    When  GET in Taxes passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details with an invalid "idsku" passing a "valid" authentication
    Then  Response code should be equal "404"
#    And  I should see the message "NÃO EXISTEM DADOS PARA SEREM RETORNADOS"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes?limit={limit}
#     ---> Limit = 2
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes?limit={limit}'
    When  GET in Taxes with limit equal "2" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Should show the default limit which is "2"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes?limit={limit}
#     ---> Limit = 10
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes?limit={limit}'
    When  GET in Taxes with limit equal "10" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Should show the default limit which is "10"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes?limit={limit}
#     ---> Limit = 100  (Maximum limit)
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes?limit={limit}'
    When  GET in Taxes with limit equal "100" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Should show the default limit which is "100"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes?limit={limit}
#     ---> Limit = 101  (Exceed limit)
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes?limit={limit}'
    When  GET in Taxes with limit equal "101" passing a "valid" authentication
    Then  Response code should be equal "422"
    And  I should see the message "Unprocessable Entity"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes?limit={limit}
#     ---> Limit = Negative value
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes?limit={limit}'
    When  GET in Taxes with limit equal "-1" passing a "valid" authentication
    Then  Response code should be equal "422"
    And  I should see the message "Unprocessable Entity"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes?limit={limit}
#     ---> Limit = 0
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes?limit={limit}'
    When  GET in Taxes with limit equal "0" passing a "valid" authentication
    Then  Response code should be equal "200"
#    Then  Response code should be equal "404"
#    And  I should see the message "ERRO AO BUSCAR DADOS NA FILA DE PROCESSAMENTO"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes?limit={limit}&lastid={lastid}
#     ---> Limit  = Default which is 50 occurs
#     ---> Lastid = Get a random lineId from response
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes?limit={limit}'
    When  GET in Taxes passing a "valid" authentication
    When  GET in Taxes with lastid passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Should show the default limit which is "50"
    And   Validate the next lineId


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes?limit={limit}&lastid={lastid}
#     ---> Limit  = 4 occurs
#     ---> Lastid = Get a random lineId from response
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes?limit={limit}'
    When  GET in Taxes passing a "valid" authentication
    When  GET in Taxes with lastid linked to limit equal "4" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Should show the default limit which is "4"
    And   Validate the next lineId


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes?limit={limit}&lastid={lastid}
#     ---> Limit  = Default which is 50 occurs
#     ---> Lastid = 0
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes?limit={limit}'
    When  GET in Taxes passing a "valid" authentication
    When  GET in Taxes with lastid equal "0" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Should show the default limit which is "50"
    And   should show fully response


###############################################################################
#   GET Status Code 401: /aldebaran-taxes/v2/taxes
#      --->  Invalid username
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    When  GET in Taxes passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


###############################################################################
#   GET Status Code 401: /aldebaran-taxes/v2/taxes
#      --->  Empty username
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    When  GET in Taxes passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


###############################################################################
#   GET Status Code 401: /aldebaran-taxes/v2/taxes
#      --->  Invalid password
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    When  GET in Taxes passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


###############################################################################
#   GET Status Code 401: /aldebaran-taxes/v2/taxes
#      --->  Empty password
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    When  GET in Taxes passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


###############################################################################
#   GET Status Code 401: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
#      --->  Invalid username
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes/idcia/idfilial/idsku'
    When  GET in Taxes passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


###############################################################################
#   GET Status Code 401: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
#      --->  Empty username
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes/idcia/idfilial/idsku'
    When  GET in Taxes passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


###############################################################################
#   GET Status Code 401: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
#      --->  Invalid password
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes/idcia/idfilial/idsku'
    When  GET in Taxes passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


###############################################################################
#   GET Status Code 401: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
#      --->  Empty password
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes/idcia/idfilial/idsku'
    When  GET in Taxes passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"


###############################################################################
#  GET: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
#    ---> Pagination (Limit = 100)
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes/idcia/idfilial/idsku'
    When  GET in Taxes with limit equal "100" passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details of the first page passing a "valid" authentication

###############################################################################
#  GET: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
#    ---> Pagination (Default = 50) only full first page
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes/idcia/idfilial/idsku'
    When  GET in Taxes passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details of the first page passing a "valid" authentication

###############################################################################
#  GET: /aldebaran-taxes/v2/taxes/{idcia}/{idfilial}/{idsku}
#    ---> Pagination (Limit = 100) scrolling 8 full pages
###############################################################################

  Scenario: GET Status Code 200 for path '/aldebaran-taxes/v2/taxes/idcia/idfilial/idsku'
    When  GET in Taxes with limit equal "100" passing a "valid" authentication
    Then  Response code should be equal "200"
    When  GET in Taxes-details with "7" pages passing a "valid" authentication