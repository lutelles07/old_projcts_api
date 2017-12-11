@ready @carriers @carriers_regions_delete
Feature: Endpoint Aldebaran Carriers-Contracts-Regions-Delete

  #*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @carriers_regions_delete --format html --out reports/carriers_contracts_regions_delete.html
#*************************************************************************************************************

  #This background process is aimed to perform a POST request before to be deleted afterwards
  Background: Access the table to get the data
    Given GET cnpj carriers-contracts-regions from database
    And   format only a region
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    When  format the endpoint through POST-response data


##############################################################################################
#   DELETE: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions/{ID}
##############################################################################################
  Scenario: DELETE Status Code 204 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions/<ID>'
    When  DELETE in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "204"
    And   Verify if the response contains the field X-tid
    And   region should be deleted from database


###############################################################################
#   DELETE: Trying to delete the resource already deleted previously
###############################################################################
  Scenario: DELETE Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions/<ID>'
    When  DELETE in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "204"
    And   Verify if the response contains the field X-tid
    When  DELETE in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Erro na Exclusao - regiao informada nao existe"


###############################################################################
#  DELETE: Entering an invalid "carrierCnpj"
###############################################################################
  Scenario: DELETE Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions/<ID>'
    When  format the body from POST-reponse passing the field "carrierCnpj" equal "99"
    When  DELETE in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Exclusao da regiao nao é possivel - Informacoes da chave invalidos. Problema ao validar transportadora -ORA-20000:"


###############################################################################
#  DELETE: Entering an invalid "contractId"
###############################################################################
  Scenario: DELETE Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions/<ID>'
    When  format the body from POST-reponse passing the field "contractId" equal "99"
    When  DELETE in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Erro na Exclusao - regiao informada nao existe"


###############################################################################
#  DELETE: Entering an invalid "id"
###############################################################################
  Scenario: DELETE Status Code 422 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions/<ID>'
    When  format the body from POST-reponse passing the field "id" equal "999"
    When  DELETE in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Erro na Exclusao - regiao informada nao existe"


##############################################################################################
#   DELETE: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions/{ID}
#    ---> Invalid authentication
##############################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Username
#-------------------------------------------------------------------------------------#
  Scenario: DELETE Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions/<ID>'
    When  DELETE in carriers-contracts-regions passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Username
#-------------------------------------------------------------------------------------#
  Scenario: DELETE Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions/<ID>'
    When  DELETE in carriers-contracts-regions passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Password
#-------------------------------------------------------------------------------------#
  Scenario: DELETE Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions/<ID>'
    When  DELETE in carriers-contracts-regions passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: DELETE Status Code 401 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions/<ID>'
    When  DELETE in carriers-contracts-regions passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"


