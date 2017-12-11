@ready @carriers @carriers_zipcode_create @deleteZipcodes
Feature: Endpoint Aldebaran Carriers-Contracts-Regions-Zipcodes-Create

#*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @carriers_zipcode_create --format html --out reports/carriers_contracts_regions_zipcode_create.html
#*************************************************************************************************************

  Background: Access the table to get the data
    Given GET cnpj carriers-contracts-regions from database

####################################################################################################
#   POST: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions/{ID}/zipcodes
####################################################################################################

  Scenario: PUT Status Code 201 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   compare carriers-zipcode with database


###############################################################################
#  POST: Create a duplicated range of CEPs
###############################################################################
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   compare carriers-zipcode with database
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    And  I should see the message "CEP inicial já está associado com uma Região do Contrato.ORA-20000: CEP final já está associado com uma Região do Contrato."


###############################################################################
#  POST: VALIDATE FIELD "zipMin" (Integer / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "zipMin"
#----------------------------------------------------#
Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "zipMin" equal "null"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "zipMin"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "zipMin" equal "empty"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "zipMax" (Integer / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "zipMax"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "zipMax" equal "null"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "zipMax"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "zipMax" equal "empty"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


#####################################################################################
#  POST: VALIDATE FIELD "status" (String / Required) - Should be:
#  A -  Faixa completamente disponível
#  I -  Faixa atendida pela transportadora, porém fora do contrato
#  S -  Faixa faz parte do contrato, porém está indisponível temporariamente
#  C -  Faixa está cancelada, ou seja, não faz mais parte da rede da transportadora
#####################################################################################

#----------------------------------------------------#
#    ---> Entering a null "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "status" equal "null"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "status" equal "empty"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering "A" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "status" equal "A"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Campo DT_SUSPENSAO deve ser nulo para situacao diferente de Suspensa"

#----------------------------------------------------#
#    ---> Entering "I" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "status" equal "I"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Campo DT_SUSPENSAO deve ser nulo para situacao diferente de Suspensa"

#----------------------------------------------------#
#    ---> Entering "C" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "status" equal "C"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Campo DT_SUSPENSAO deve ser nulo para situacao diferente de Suspensa"


###############################################################################
#  POST: VALIDATE FIELD "status" (String / Required) with expirationDate (Date / Optional)
#  For "status" equal "A", "I", "C" =>  "expirationDate" should be null
###############################################################################

#----------------------------------------------------------#
#    ---> Entering "expirationDate" = null + status = "A"
#----------------------------------------------------------#
  Scenario: PUT Status Code 201 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "status" equal "A" with "expirationDate" equal "null"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   compare carriers-zipcode with database

#----------------------------------------------------------#
#    ---> Entering "expirationDate" = empty + status = "I"
#----------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "status" equal "I" with "expirationDate" equal "empty"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"
  #  And   compare carriers-zipcode with database

#----------------------------------------------------------#
#    ---> Entering "expirationDate" = null + status = "C"
#----------------------------------------------------------#
  Scenario: PUT Status Code 201 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "status" equal "C" with "expirationDate" equal "null"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   compare carriers-zipcode with database


###################################################################################
#  POST: VALIDATE FIELD "expirationDate" (Date / Optional) - Should be: YYYY-MM-DD
###################################################################################

#----------------------------------------------------#
#    ---> Entering a null "expirationDate"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "expirationDate" equal "null"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    And  I should see the message "Para situação igual a S, campo DT_SUSPENSAO deve ser informado"

#----------------------------------------------------#
#    ---> Entering an empty "expirationDate"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "expirationDate" equal "empty"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"
#    And  I should see the message "Para situação igual a S, campo DT_SUSPENSAO deve ser informado"

#-------------------------------------------------------#
#    ---> Entering an invalid format in "expirationDate"
#-------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "expirationDate" equal "31-12-2017"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "expirationDate" equal "29-02-2018"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "expirationDate" equal "20-02-2018"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "expirationDate" equal "33-03-2018"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "comments" (String / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "comments"
#----------------------------------------------------#
  Scenario: PUT Status Code 201 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "comments" equal "null"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   compare carriers-zipcode with database

#----------------------------------------------------#
#    ---> Entering an empty "comments"
#----------------------------------------------------#
  Scenario: PUT Status Code 201 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "comments" equal "empty"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   compare carriers-zipcode with database


###############################################################################
#  POST: VALIDATE FIELD "trackingUpdate/user" (String / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "trackingUpdate/user"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "user" equal "null"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    And  I should see the message "Campo 'USUARIO' é obrigatorio e esta nulo"

#----------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/user"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "user" equal "empty"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    And  I should see the message "Campo 'USUARIO' é obrigatorio e esta nulo"


###################################################################################
#  POST: VALIDATE FIELD "trackingUpdate/dateTime" (YYYY-MM-DDTHH:MM:SS / Required)
###################################################################################

#----------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/dateTime"
#----------------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "dateTime" equal "null"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    And  I should see the message "Campo 'DATAHORA' é obrigatorio e esta nulo"

#-----------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/dateTime"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "dateTime" equal "empty"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"
#    And  I should see the message "Campo 'DATAHORA' é obrigatorio e esta nulo"

#-------------------------------------------------------------#
#    ---> Entering an invalid format in "trackingUpdate/dateTime"
#-------------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "dateTime" equal "2015/10/06T12:01:01"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "dateTime" equal "2015/02/29T12:01:01"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "dateTime" equal "2015/02/30T12:01:01"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "dateTime" equal "2015/03/33T12:01:01"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------#
#    ---> Entering an invalid date in "trackingUpdate/dateTime"
#-------------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "dateTime" equal "01-03-2016T12:01:01"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "dateTime" equal "29-02-2016T12:01:01"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "dateTime" equal "30-02-2016T12:01:01"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  Entering in carrier-contracts-zipcodes body the field "dateTime" equal "33-03-2016T12:01:01"
    When  POST in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


####################################################################################################
#   POST: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions/{ID}/zipcodes
#    ---> Invalid authentication
####################################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Username
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  POST in carriers-regions-zipcode passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Username
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  POST in carriers-regions-zipcode passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Password
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  POST in carriers-regions-zipcode passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes'
    When   format contract-regions-zipcodes passing regionID equal "1"
    When  POST in carriers-regions-zipcode passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"
