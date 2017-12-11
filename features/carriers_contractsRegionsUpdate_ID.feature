@ready @carriers @carriers_regions_updateID
Feature: Endpoint Aldebaran Carriers-Contracts-Regions-Update_Batch

#*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @carriersRegionsUpdateID --format html --out reports/carriers_contracts_regions_update_ID.html
#*************************************************************************************************************

  Background: Access the table to get the data
    Given GET cnpj carriers-contracts-regions from database

################################################################################################
#   PUT: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions/{regionID}
################################################################################################

  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update a region entering regionID equal "1"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data


###############################################################################
#  PUT: Passing an invalid regionID in the endpoint
###############################################################################
  Scenario: PUT Status Code 422 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update a region entering regionID equal "100000"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Regiao não atualizada por não ser encontrada"


###############################################################################
#  PUT: VALIDATE FIELD "name" (String / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "name"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update a region entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "name" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "name"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update a region entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "name" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "averageDistanceKm" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "averageDistanceKm"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update a region entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "averageDistanceKm" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "averageDistanceKm"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "averageDistanceKm" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "averageDistanceKm"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "averageDistanceKm" equal "string"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "clearanceFee" (Boolean / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "clearanceFee"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "clearanceFee" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "clearanceFee"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "clearanceFee" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "transitTime" (Integer / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "transitTime"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "transitTime" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "transitTime"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "transitTime" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an invalid "transitTime"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "transitTime" equal "string"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "megaRouteId" (String / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "megaRouteId"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "megaRouteId" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "megaRouteId"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "megaRouteId" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "megaRouteId"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "megaRouteId" equal "string"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Mega Rota não cadastrada para a transportadora"


###############################################################################
#  PUT: VALIDATE FIELD "returnTransitTime" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "returnTransitTime"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "returnTransitTime" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "returnTransitTime"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "returnTransitTime" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "returnTransitTime"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "returnTransitTime" equal "string"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "maxWeight" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "maxWeight"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "maxWeight" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "maxWeight"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "maxWeight" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "maxWeight"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "maxWeight" equal "string"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "cubage" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "cubage"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "cubage" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "cubage"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "cubage" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "cubage"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "cubage" equal "string"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "maxVolume" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "maxVolume"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "maxVolume" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "maxVolume"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "maxVolume" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "maxVolume"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "maxVolume" equal "string"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "status" (Integer / Required) - Should be:
#  A: ativo
#  I: inativo
#  S: Suspenso
#  C: Cancelado
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "status" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "status" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering "A" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "status" equal "A"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering "I" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "status" equal "I"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering "S" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "status" equal "S"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering "C" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "status" equal "C"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering "X" in "status"
#----------------------------------------------------#
  Scenario: PUT Status Code 422 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "status" equal "X"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "O valor para o campo 'SITUACAO'  deve ser A, I, S ou C"


###############################################################################
#  PUT: VALIDATE FIELD "reverseTransitTime" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "reverseTransitTime"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "reverseTransitTime" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "reverseTransitTime"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "reverseTransitTime" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "reverseTransitTime"
#----------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "reverseTransitTime" equal "string"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "carrierCode" (String / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "carrierCode"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "carrierCode" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "carrierCode"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "carrierCode" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "carrierCode"
#----------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "carrierCode" equal "string"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "exchangeGatheringOnDelivery" (String / Required)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "exchangeGatheringOnDelivery"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "exchangeGatheringOnDelivery" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#--------------------------------------------------------------#
#    ---> Entering an empty "exchangeGatheringOnDelivery"
#--------------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "exchangeGatheringOnDelivery" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#--------------------------------------------------------------#
#    ---> Entering true value in "exchangeGatheringOnDelivery"
#--------------------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "exchangeGatheringOnDelivery" equal "true"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data

#--------------------------------------------------------------#
#    ---> Entering false value in "exchangeGatheringOnDelivery"
#--------------------------------------------------------------#
  Scenario: PUT Status Code 200 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "exchangeGatheringOnDelivery" equal "false"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions-ID should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "trackingUpdate/user" (String / Required)
###############################################################################

#--------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/user"
#--------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "user" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#--------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/user"
#--------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "user" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


#######################################################################################################
#  PUT: VALIDATE FIELD "trackingUpdate/dateTime" (DateTime / Required) - Should be YYYY-MM-DDTHH:MM:SS
#######################################################################################################

#--------------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/dateTime"
#--------------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "null"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/dateTime"
#-------------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "empty"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#--------------------------------------------------------------#
#    ---> Entering an invalid format "trackingUpdate/dateTime"
#--------------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "2012/06/29T15:13:38"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "2012/02/29T15:13:38"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "2012/02/30T15:13:38"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "2012/03/33T15:13:38"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#--------------------------------------------------------------#
#    ---> Entering an invalid format "trackingUpdate/dateTime"
#--------------------------------------------------------------#
  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "05-06-2017T15:13:38"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "29-02-2017T15:13:38"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "30-02-2017T15:13:38"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update region-batch entering regionID equal "1"
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "33-03-2017T15:13:38"
    When  PUT in carriers-regions-update-id passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


################################################################################################
#   PUT: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions/{regionID}
#    ---> Invalid authentication
################################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Username
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update a region entering regionID equal "1"
    When  PUT in carriers-regions-update-id passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update a region entering regionID equal "1"
    When  PUT in carriers-regions-update-id passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Password
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update a region entering regionID equal "1"
    When  PUT in carriers-regions-update-id passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: PUT Status Code 401 for path '/carriers/<cnpj>/contracts/<branchId>/<contractId>/regions/<regionID>'
    And   format contract for update a region entering regionID equal "1"
    When  PUT in carriers-regions-update-id passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"
