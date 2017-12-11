@ready @b2bcontracts @get_id_client
Feature: Creation and update service for carrier contracts
  It provides POST, update ( PUT), and query (GET) services for contracts in the SIGE system of e-commerce company
  Walmart with its trading partners

#***************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @b2bcontracts --format html --out reports/b2bcontracts.html
#***************************************************************************************************************

###############################################################################
# POST: /aldebaran-b2bcontracts/b2bcontracts
###############################################################################

  Scenario: Create contract for b2b sellers for the path '/aldebaran-b2bcontracts/b2bcontracts'
    When  POST in b2bcontracts passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Post a request without the filial on the b2bcontacts
    When  POST in b2bcontracts without "filial" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Post a request without the transportadora on the b2bcontacts
    When  POST in b2bcontracts without "transportadora" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Post a request without the contratoTransp on the b2bcontacts
    When  POST in b2bcontracts without "contratoTransp" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Post a request without the situacaoTransp on the b2bcontacts
    When  POST in b2bcontracts without "situacaoTransp" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Post a request without the tipoEntrega on the b2bcontacts
    When  POST in b2bcontracts without "tipoEntrega" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Post a request without the tipoPresente on the b2bcontacts
    When  POST in b2bcontracts without "tipoPresente" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Post a request without the zipCodeCob on the b2bcontacts
    When  POST in b2bcontracts without "zipCodeCob" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Post a request without the pzPagamentoBoleto on the b2bcontacts
    When  POST in b2bcontracts without "pzPagamentoBoleto" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Post a request without the periodoFat on the b2bcontacts
    When  POST in b2bcontracts without "periodoFat" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

###############################################################################
# PUT: /aldebaran-b2bcontracts/b2bcontracts
###############################################################################

  Scenario: Update contract for b2b sellers for the path '/aldebaran-b2bcontracts/b2bcontracts'
    When  PUT in b2bcontracts passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Update a request without the filial on the b2bcontacts
    When  PUT in b2bcontracts without "filial" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Update a request without the transportadora on the b2bcontacts
    When  PUT in b2bcontracts without "transportadora" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Update a request without the contratoTransp on the b2bcontacts
    When  PUT in b2bcontracts without "contratoTransp" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Update a request without the situacaoTransp on the b2bcontacts
    When  PUT in b2bcontracts without "situacaoTransp" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Update a request without the tipoEntrega on the b2bcontacts
    When  PUT in b2bcontracts without "tipoEntrega" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Update a request without the tipoPresente on the b2bcontacts
    When  PUT in b2bcontracts without "tipoPresente" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Update a request without the zipCodeCob on the b2bcontacts
    When  PUT in b2bcontracts without "zipCodeCob" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

###############################################################################
                  #  NEGATIVE SCENARIOS POST  #
###############################################################################

  Scenario: Post a request without the idCliente on the b2bcontacts
    When  POST in b2bcontracts without "idCliente" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Parametro obrigatorio esta nulo (P_ID_CLIENTE)"

  Scenario: Post a request without the numContrato on the b2bcontacts
    When  POST in b2bcontracts without "numContrato" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Parametro obrigatorio esta nulo (P_NUM_CONTRATO)"

  Scenario: Post a request without the numSubContrato on the b2bcontacts
    When  POST in b2bcontracts without "numSubContrato" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Parametro obrigatorio esta nulo"

  Scenario: Post a request without the pzEntrega on the b2bcontacts
    When  POST in b2bcontracts without "pzEntrega" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Parametro obrigatorio esta nulo"

  Scenario: Post a request without the tipoOperComl on the b2bcontacts
    When  POST in b2bcontracts without "tipoOperComl" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Parametro obrigatorio esta nulo (P_TIPO_OPER_COML)"

  Scenario: Post a request without the lote on the b2bcontacts
    When  POST in b2bcontracts without "lote" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Parametro obrigatorio esta nulo (P_IN_LOTE)"

  Scenario: Post a request without the canalVenda on the b2bcontacts
    When  POST in b2bcontracts without "canalVenda" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Parametro obrigatorio esta nulo (P_CANAL_VENDA)"

  Scenario: Post a request without the tipoPedido on the b2bcontacts
    When  POST in b2bcontracts without "tipoPedido" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Parametro obrigatorio esta nulo (P_IN_PEDIDO)"

  Scenario: Post a request without the meioPagamentoPedido on the b2bcontacts
    When  POST in b2bcontracts without "meioPagamentoPedido" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Parametro obrigatorio esta nulo (P_MEIO_PAGTO_PEDIDO)"

  Scenario: Post a request without the diaFixoBoleto on the b2bcontacts
    When  POST in b2bcontracts without "diaFixoBoleto" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  Scenario: Post a request without the pzDiaCorte on the b2bcontacts
    When  POST in b2bcontracts without "pzDiaCorte" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then I valid the response body

  # Scenario: Post a request without the idAgencia on the b2bcontacts
  #   When  POST in b2bcontracts without "idAgencia" passing a "valid" authentication
  #   Then  Response code should be equal "200"
  #   And   Verify if the response contains the field X-tid
  #   Then I valid the response body


###############################################################################
                  #  NEGATIVE SCENARIOS PUT  #
###############################################################################

  Scenario: Update contract for b2b sellers for the path '/aldebaran-b2bcontracts/b2bcontracts'
    When put in b2bcontracts without the idCliente passing a "valid" authentication
    Then  Response code should be equal "500"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Internal Server Error"

  Scenario: Update contract for b2b sellers for the path '/aldebaran-b2bcontracts/b2bcontracts'
    When put in b2bcontracts without the numContrato passing a "valid" authentication
    Then  Response code should be equal "500"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Internal Server Error"

  Scenario: Update contract for b2b sellers for the path '/aldebaran-b2bcontracts/b2bcontracts'
    When put in b2bcontracts without the numSubContrato passing a "valid" authentication
    Then  Response code should be equal "500"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Internal Server Error"

  Scenario: Update a request without the pzEntrega on the b2bcontacts
    When  PUT in b2bcontracts without "pzEntrega" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "pzEntrega can not be changed."

  Scenario: Update a request without the tipoOperComl on the b2bcontacts
    When  PUT in b2bcontracts without "tipoOperComl" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "tipoOperComl can not be changed."

  Scenario: Update a request without the lote on the b2bcontacts
    When  PUT in b2bcontracts without "lote" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "lote can not be changed."

  Scenario: Update a request without the canalVenda on the b2bcontacts
    When  PUT in b2bcontracts without "canalVenda" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "canalVenda can not be changed."

  Scenario: Update a request without the tipoPedido on the b2bcontacts
    When  PUT in b2bcontracts without "tipoPedido" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "tipoPedido can not be changed."

  Scenario: Update a request without the meioPagamentoPedido on the b2bcontacts
    When  PUT in b2bcontracts without "meioPagamentoPedido" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "meioPagamentoPedido can not be changed"

  Scenario: Update a request without the diaFixoBoleto on the b2bcontacts
    When  PUT in b2bcontracts without "diaFixoBoleto" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "diaFixoBoleto can not be changed."

  Scenario: Update a request without the pzPagamentoBoleto on the b2bcontacts
    When  PUT in b2bcontracts without "pzPagamentoBoleto" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "pzPagamentoBoleto can not be changed"

  Scenario: Update a request without the periodoFat on the b2bcontacts
    When  PUT in b2bcontracts without "periodoFat" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "periodoFat can not be changed"

  Scenario: Update a request without the pzDiaCorte on the b2bcontacts
    When  PUT in b2bcontracts without "pzDiaCorte" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "pzDiaCorte can not be changed."

  Scenario: Update a request without the idAgencia on the b2bcontacts
    When  PUT in b2bcontracts without "idAgencia" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "idAgencia can not be changed."

###############################################################################
# POST: /aldebaran-b2bcontracts/b2bcontracts
#           INVALID AUTHENTICATION
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    When  POST in b2bcontracts passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    When  POST in b2bcontracts passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    When  POST in b2bcontracts passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    When  POST in b2bcontracts passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

###############################################################################
# PUT: /aldebaran-b2bcontracts/b2bcontracts
#           INVALID AUTHENTICATION
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    When put in b2bcontracts without the idCliente passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    When put in b2bcontracts without the idCliente passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    When put in b2bcontracts without the idCliente passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"

  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    When put in b2bcontracts without the idCliente passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"
