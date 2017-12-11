@ready @carriers @carriers_zipcode_delete
Feature: Endpoint Aldebaran Carriers-Contracts-Regions-Zipcodes-Delete

#*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @carriers_zipcode_delete --format html --out reports/carriers_contracts_regions_zipcode_delete.html
#*************************************************************************************************************

  Background: Access the table to get the data
    Given GET cnpj carriers-contracts-regions-zipcodes from database

####################################################################################################################
#   DELETE: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions/{ID}/zipcodes/cepini/cepfim
####################################################################################################################
  Scenario: DELETE Status Code 204 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "204"
    And   Verify if the response contains the field X-tid
    And   zipcode should be delete from database


###############################################################################
#  DELETE: Delete range of CEPs twice
###############################################################################
  Scenario: DELETE Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "204"
    And   Verify if the response contains the field X-tid
    And   zipcode should be delete from database
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Erro na Exclusao - Faixa de Cep informada nao existe"


###############################################################################
#  DELETE:   VALIDATE FIELD "zipMin" (Integer / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering an invalid (numeric) "zipMin"
#----------------------------------------------------#
  Scenario: DELETE Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering the field "zipMin" equal "12345678" in the URL
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Erro na Exclusao - Faixa de Cep informada nao existe"

#----------------------------------------------------#
#    ---> Entering an empty "zipMin"
#----------------------------------------------------#
  Scenario: DELETE Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering the field "zipMin" equal "empty" in the URL
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Not Found"

#----------------------------------------------------#
#    ---> Entering a null "zipMin"
#----------------------------------------------------#
  Scenario: DELETE Status Code 404 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering the field "zipMin" equal "null" in the URL
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Not Found"

#----------------------------------------------------#
#    ---> Entering an invalid (alphanumeric) "zipMin"
#----------------------------------------------------#
  Scenario: DELETE Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering the field "zipMin" equal "string" in the URL
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  DELETE:   VALIDATE FIELD "zipMax" (Integer / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering an invalid (numeric) "zipMax"
#----------------------------------------------------#
  Scenario: DELETE Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering the field "zipMax" equal "12345678" in the URL
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Erro na Exclusao - Faixa de Cep informada nao existe"

#----------------------------------------------------#
#    ---> Entering an empty "zipMax"
#----------------------------------------------------#
  Scenario: DELETE Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering the field "zipMax" equal "empty" in the URL
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Not Found"

#----------------------------------------------------#
#    ---> Entering a null "zipMax"
#----------------------------------------------------#
  Scenario: DELETE Status Code 404 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering the field "zipMax" equal "null" in the URL
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Not Found"

#----------------------------------------------------#
#    ---> Entering an invalid (alphanumeric) "zipMax"
#----------------------------------------------------#
  Scenario: DELETE Status Code 400 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  Entering the field "zipMax" equal "string" in the URL
    When  DELETE in carriers-regions-zipcode passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


####################################################################################################################
#   DELETE: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions/{ID}/zipcodes/cepini/cepfim
#    ---> Invalid authentication
####################################################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Username
#-------------------------------------------------------------------------------------#
  Scenario: DELETE Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  DELETE in carriers-regions-zipcode passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: DELETE Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  DELETE in carriers-regions-zipcode passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Password
#-------------------------------------------------------------------------------------#
  Scenario: DELETE Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  DELETE in carriers-regions-zipcode passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: DELETE Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<id>/zipcodes/<cepini>/<cepfim>'
    When  DELETE in carriers-regions-zipcode passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"



