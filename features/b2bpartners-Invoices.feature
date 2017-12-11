@ready @b2bpartnersInvoices @all_b2bpartners 
Feature: Endpoint Aldebaran B2BPartners Invoices

#**************************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @b2bpartnersInvoices --format html --out reports/b2bpartners-Invoices.html
#**************************************************************************************************************************

#-------------------------------------------------------------------------------------------------------
# Q U E R Y   -   D E L E T E    I N V O I C E S (Need to be run manually before executing all scenarios)
#-------------------------------------------------------------------------------------------------------
#  begin
#     for x in (select distinct (nd.bndd_id_nota_debito)
#               from sige_b2b_nota_debito_detalhe nd
#               where nd.bndd_data_inclusao >= sysdate - 100
#               and   nd.bndd_id_instancia is null
#               and   nd.bndd_usuario_inclusao in ('SWMART', 'ALD_B2BPARTNERS_USR', 'LOCKDOWN_USR')) loop
#     delete from sige_b2b_nota_debito_detalhe d
#     where d.bndd_id_nota_debito = x.bndd_id_nota_debito;
#     --
#     delete from sige_b2b_nota_debito_cabecalho c
#     where c.bndc_id_nota_debito = x.bndd_id_nota_debito;
#     --
#     commit;
#     end loop;
#  end;
#-------------------------------------------------------------------------------------------------------

  Background:
    Given GET B2BPartners invoice ID from database

###############################################################################
# POST: /b2bpartners/{cnpj}/invoices
#   --> Generating 1 invoice
###############################################################################
  @delete_invoices
  Scenario: POST Status Code 201: POST response validate when adding only 1 valid invoice for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-invoices with database

###############################################################################
# POST: /b2bpartners/{cnpj}/invoices
#   --> Generating invoice twice (Duplicated invoices)
###############################################################################

  Scenario: POST Status Code 422: POST response validate when adding a duplicated invoice for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-invoices with database
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "422"
    And  I should see the message "Nota de débito já informada e totalmente processada"

###############################################################################
# POST: /b2bpartners/{cnpj}/invoices
#   --> Generating 2 invoices
###############################################################################

  Scenario: POST Status Code 201: POST response validate when adding 2 valid invoices for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "2" invoice(s)
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-invoices with database

###############################################################################
# POST: /b2bpartners/{cnpj}/invoices
#   --> CNPJ does not match the invoiceNumber's cnpj  (returnId = 202)
###############################################################################

  Scenario: POST Status Code 422: POST response validate when adding only 1 valid invoice in which CNPJ is divergent for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Generating a incompatible CNPJ
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Should see returnId equal "202" with message "Nota fiscal não é do parceiro"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Empty debitNoteId
###############################################################################

  Scenario: POST Status Code 400: Empty debitNoteId for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "debitNoteId" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Null debitNoteId
###############################################################################

  Scenario: POST Status Code 400: Null debitNoteId for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "debitNoteId" equal "null"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Empty totalValue
###############################################################################

  Scenario: POST Status Code 400: Empty debitNoteId for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "totalValue" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Null totalValue
###############################################################################

  Scenario: POST Status Code 400: Null debitNoteId for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "totalValue" equal "null"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Empty invoicesAmount
###############################################################################

  Scenario: POST Status Code 400: Empty invoicesAmount for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "invoicesAmount" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Null invoicesAmount
###############################################################################

  Scenario: POST Status Code 400: Null invoicesAmount for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "invoicesAmount" equal "null"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Divergent invoicesAmount
###############################################################################

  Scenario: POST Status Code 422: Divergent invoicesAmount for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "invoicesAmount" equal "30"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "422"
    And  I should see the message "Quantidade de notas fiscais divergente"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Empty issueDate
###############################################################################

  Scenario: POST Status Code 400: Empty issueDate for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "issueDate" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Null issueDate
###############################################################################

  Scenario: POST Status Code 400: Null issueDate for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "issueDate" equal "null"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Empty dueDate
###############################################################################

  Scenario: POST Status Code 400: Empty dueDate for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "dueDate" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    HEADER: Null dueDate
###############################################################################

  Scenario: POST Status Code 400: Null dueDate for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "dueDate" equal "null"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Empty branchId
###############################################################################

  Scenario: POST Status Code 400: Empty branchId for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "branchId" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Null branchId
###############################################################################

  Scenario: POST Status Code 400: Null branchId for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "branchId" equal "null"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Invalid branchId  (returnId = 201)
###############################################################################

  Scenario: POST Status Code 400: Invalid branchId for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "branchId" equal "99"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Should see returnId equal "201" with message "Nota fiscal não existe"


###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Empty invoiceNumber
###############################################################################

  Scenario: POST Status Code 400: Empty invoiceNumber for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "invoiceNumber" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Null invoiceNumber
###############################################################################

  Scenario: POST Status Code 400: Null invoiceNumber for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "invoiceNumber" equal "null"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Invalid invoiceNumber  (returnId = 202)
###############################################################################

  Scenario: POST Status Code 400: Null invoiceNumber for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "invoiceNumber" equal "11112"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Should see returnId equal "201" with message "Nota fiscal não existe"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Empty serie
###############################################################################

  Scenario: POST Status Code 400: Invalid serie for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "serie" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Null serie
###############################################################################

  Scenario: POST Status Code 400: Null serie for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "serie" equal "null"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Invalid serie   (returnId = 201)
###############################################################################

  Scenario: POST Status Code 400: Null serie for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "serie" equal "99"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Should see returnId equal "201" with message "Nota fiscal não existe"


###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Empty value
###############################################################################

  Scenario: POST Status Code 400: Empty value for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "value" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Null value
###############################################################################

  Scenario: POST Status Code 400: Null value for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "value" equal "null"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Divergent value (returnId = 204)
###############################################################################

  Scenario: POST Status Code 201: Divergent value for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "value" equal "999.9"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Should see returnId equal "204" with message "Valor informado diferente da nf"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Empty operationType
###############################################################################

  Scenario: POST Status Code 400: Empty operationType for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "operationType" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Null operationType
###############################################################################

  Scenario: POST Status Code 400: Null operationType for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "operationType" equal "null"
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "400"
    And  I should see the message "Bad Request"

###############################################################################
#  POST: /b2bpartners/{cnpj}/invoices
#-----------------------------------------------------------------------------
#                    DETAIL: Empty instanceId
###############################################################################

  Scenario: POST Status Code 201: Empty instanceId for path "/b2bpartners/{cnpj}/invoices"
    When  Format the invoice body with "1" invoice(s)
    When  Entering the field "instanceId" equal ""
    When  POST in B2BPartners-invoices passing a "valid" authentication
    Then  Response code should be equal "201"
    And   compare b2bpartners-invoices with database

###############################################################################
# POST: /b2bpartners/{cnpj}/invoices
#   --> Invalid authentication (Invalid Username)
###############################################################################

Scenario: POST Status Code 401: Cliente não autenticado: Invalid Username
    When  Format the invoice body with "1" invoice(s)
    When  POST in B2BPartners-invoices passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

###############################################################################
# POST: /b2bpartners/{cnpj}/invoices
#   --> Invalid authentication (Empty Username)
###############################################################################

  Scenario: POST Status Code 401: Cliente não autenticado: Empty Username
    When  Format the invoice body with "1" invoice(s)
    When  POST in B2BPartners-invoices passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

###############################################################################
# POST: /b2bpartners/{cnpj}/invoices
#   --> Invalid authentication (Invalid Password)
###############################################################################

  Scenario: POST Status Code 401: Cliente não autenticado: Invalid Password
    When  Format the invoice body with "1" invoice(s)
    When  POST in B2BPartners-invoices passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

###############################################################################
# POST: /b2bpartners/{cnpj}/invoices
#   --> Invalid authentication (Empty Password)
###############################################################################

  Scenario: POST Status Code 401: Cliente não autenticado: Empty Password
    When  Format the invoice body with "1" invoice(s)
    When  POST in B2BPartners-invoices passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"
