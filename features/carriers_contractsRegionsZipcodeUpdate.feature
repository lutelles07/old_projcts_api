@ready @carriers @carriers_zipcode_update @deleteZipcodes
Feature: Endpoint Aldebaran Carriers-Contracts-Regions-Zipcodes-Update

#*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @carriers_zipcode_update --format html --out reports/carriers_contracts_regions_zipcode_update.html
#*************************************************************************************************************

  Background: Access the table to get the data
    Given GET cnpj carriers-contracts-regions-zipcodes from database

#################################################################################################################
#   PUT: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions/{ID}/zipcodes/cepini/cepfim
#################################################################################################################

  Scenario: PUT Status Code 200 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   zipcode should be updated in database


###############################################################################
#  PUT: Update the same CNPJ twice - changing Zipcodes
###############################################################################
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   zipcode should be updated in database
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    And  I should see the message "Faixa de Cep não atualizada por não ser encontrada"


###############################################################################
#  PUT: VALIDATE FIELD "newZipMin" (Integer / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "newZipMin"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "newZipMin" equal "null"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "newZipMin"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "newZipMin" equal "empty"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering a valid "newZipMin"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "newZipMin" equal "60000000"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   zipcode should be updated in database


###############################################################################
#  PUT: VALIDATE FIELD "newZipMax" (Integer / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "newZipMax"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "newZipMax" equal "null"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "newZipMax"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "newZipMax" equal "empty"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering a valid "newZipMax"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "newZipMax" equal "70000000"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   zipcode should be updated in database


####################################################################################
#  PUT: VALIDATE FIELD "status" (String / Required) - Should be:
#  A -  Faixa completamente disponível
#  I -  Faixa atendida pela transportadora, porém fora do contrato
#  S -  Faixa faz parte do contrato, porém está indisponível temporariamente
#  C -  Faixa está cancelada, ou seja, não faz mais parte da rede da transportadora
####################################################################################

#----------------------------------------------------#
#    ---> Entering a null "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "status" equal "null"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "status" equal "empty"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering "A" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "status" equal "A"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Campo DT_SUSPENSAO deve ser nulo para situacao diferente de Suspensa"

#----------------------------------------------------#
#    ---> Entering "I" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "status" equal "I"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Campo DT_SUSPENSAO deve ser nulo para situacao diferente de Suspensa"

#----------------------------------------------------#
#    ---> Entering "C" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "status" equal "C"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Campo DT_SUSPENSAO deve ser nulo para situacao diferente de Suspensa"


###############################################################################
#  PUT: VALIDATE FIELD "expirationDate" (Date / Optional) - Should be: YYYY-MM-DD
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "expirationDate"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "expirationDate" equal "null"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    And  I should see the message "Para situação igual a S, campo DT_SUSPENSAO deve ser informado"

#----------------------------------------------------#
#    ---> Entering an empty "expirationDate"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "expirationDate" equal "empty"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"
#    And  I should see the message "Para situação igual a S, campo DT_SUSPENSAO deve ser informado"

#----------------------------------------------------#
#    ---> Entering an invalid format "expirationDate"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "expirationDate" equal "31-12-2017"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an invalid format "expirationDate"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "expirationDate" equal "2017/05/07"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an invalid date in "expirationDate"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "expirationDate" equal "2019-12-0D"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "comments" (String / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a valid "comments"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "comments" equal "string"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   zipcode should be updated in database


###############################################################################
#  PUT: VALIDATE FIELD "trackingUpdate/user" (String / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "trackingUpdate/user"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "user" equal "null"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    And  I should see the message "Campo 'USUARIO' é obrigatorio e esta nulo"

#----------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/user"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "user" equal "empty"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    And  I should see the message "Campo 'USUARIO' é obrigatorio e esta nulo"


###############################################################################
#  PUT: VALIDATE FIELD "trackingUpdate/dateTime" (YYYY-MM-DDTHH:MM:SS / Required)
###############################################################################

#--------------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/dateTime"
#--------------------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "dateTime" equal "null"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    And  I should see the message "Campo 'DATAHORA' é obrigatorio e esta nulo"

#--------------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/dateTime"
#--------------------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "dateTime" equal "empty"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"
#    And  I should see the message "Campo 'DATAHORA' é obrigatorio e esta nulo"

#----------------------------------------------------------------#
#    ---> Entering an invalid format in "trackingUpdate/dateTime"
#----------------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "dateTime" equal "2015/10/06T12:01:01"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "dateTime" equal "2015/02/29T12:01:01"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "dateTime" equal "2015/02/30T12:01:01"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "dateTime" equal "2015/03/33T12:01:01"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------------#
#    ---> Entering an invalid format in "trackingUpdate/dateTime"
#----------------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "dateTime" equal "07-12-2019T12:01:01"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "dateTime" equal "29-02-2019T12:01:01"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering in carrier-contracts-zipcodes for update in which the field "dateTime" equal "31-09-2019T12:01:01"
    When  PUT in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


#################################################################################################################
#   PUT: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions/{ID}/zipcodes/cepini/cepfim
#    ---> Invalid authentication
#################################################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Username
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  PUT in carriers-regions-zipcode passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  PUT in carriers-regions-zipcode passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Password
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  PUT in carriers-regions-zipcode passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  PUT in carriers-regions-zipcode passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"
