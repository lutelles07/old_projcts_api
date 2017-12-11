@ready @carriers @carriers_contracts_regions
Feature: Endpoint Aldebaran Carriers-Contracts-Regions

#*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @carriersContractsRegions --format html --out reports/carriers_contracts_regions.html
#*************************************************************************************************************

  Background: Access the table to get the data
    Given GET cnpj carriers-contracts-regions from database

###############################################################################
#  POST: VALIDATE FIELD "averageDistanceKm" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "averageDistanceKm"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null averageDistanceKm for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "averageDistanceKm" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "averageDistanceKm"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty averageDistanceKm for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "averageDistanceKm" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data


###############################################################################
#  POST: VALIDATE FIELD "branch" (Integer / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "branch"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null branch for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "name" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "branch"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty branch for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "name" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "clearanceFee" (Boolean / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "clearanceFee"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null clearanceFee for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "clearanceFee" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "clearanceFee"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty clearanceFee for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "clearanceFee" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "transitTime" (Integer / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "transitTime"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null transitTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "transitTime" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "transitTime"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty transitTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "transitTime" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an invalid "transitTime"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid transitTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "transitTime" equal "string"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "megaRouteId" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "megaRouteId"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null megaRouteId for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "megaRouteId" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "megaRouteId"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty megaRouteId for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "megaRouteId" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "megaRouteId"
#----------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid megaRouteId for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "megaRouteId" equal "string"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Mega Rota não cadastrada para a transportadora"


###############################################################################
#  POST: VALIDATE FIELD "returnTransitTime" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "returnTransitTime"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null returnTransitTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "returnTransitTime" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "returnTransitTime"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty returnTransitTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "returnTransitTime" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "returnTransitTime"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid returnTransitTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "returnTransitTime" equal "string"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "maxWeight" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "maxWeight"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null maxWeight for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "maxWeight" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "maxWeight"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty maxWeight for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "maxWeight" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "maxWeight"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid maxWeight for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "maxWeight" equal "string"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "cubage" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "cubage"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null cubage for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "cubage" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "cubage"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty cubage for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "cubage" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "cubage"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid cubage for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "cubage" equal "string"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "maxVolume" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "maxVolume"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null cubage for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "maxVolume" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "maxVolume"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty cubage for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "maxVolume" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "maxVolume"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid cubage for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "maxVolume" equal "string"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "status" (Integer / Optional) - Should be:
#  A: ativo
#  I: inativo
#  S: Suspenso
#  C: Cancelado
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "status"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null status for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "status" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "status"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty status for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "status" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an invalid "status"
#----------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid status for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "status" equal "X"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "O valor para o campo 'SITUACAO'  deve ser A, I, S ou C"


###############################################################################
#  POST: VALIDATE FIELD "reverseTransitTime" (Integer / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "reverseTransitTime"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null reverseTransitTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "reverseTransitTime" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "reverseTransitTime"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty reverseTransitTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "reverseTransitTime" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "reverseTransitTime"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid reverseTransitTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "reverseTransitTime" equal "string"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "carrierCode" (String / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "carrierCode"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null carrierCode for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "carrierCode" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an empty "carrierCode"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty carrierCode for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "carrierCode" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data

#----------------------------------------------------#
#    ---> Entering an invalid "carrierCode"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an invalid carrierCode for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "carrierCode" equal "string"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data


###############################################################################
#  POST: VALIDATE FIELD "exchangeGatheringOnDelivery" (Boolean / Required)
###############################################################################

#--------------------------------------------------------#
#    ---> Entering a null "exchangeGatheringOnDelivery"
#--------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null exchangeGatheringOnDelivery for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "exchangeGatheringOnDelivery" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#--------------------------------------------------------#
#    ---> Entering an empty "exchangeGatheringOnDelivery"
#---------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty exchangeGatheringOnDelivery for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "exchangeGatheringOnDelivery" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "trackingUpdate/user" (String / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "trackingUpdate/user"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null trackingUpdate/user for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "user" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/user"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty trackingUpdate/user for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "user" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "trackingUpdate/dateTime" (DateTime / Required) - - Should be YYYY-MM-DDTHH:MM:SS
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "null"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "empty"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering an invalid format in "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "04-08-2016T15:13:38"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "29-02-2016T15:13:38"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "30-02-2016T15:13:38"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "33-03-2016T15:13:38"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering an invalid format in "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "2012/06/29T15:13:38"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "2012/02/29T15:13:38"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "2012/02/30T15:13:38"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions"
    And   format only a region
    When  Entering in carrier-contracts-regions body the field "dateTime" equal "2012/03/33T15:13:38"
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


######################################################################################
#   POST: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions
#     --->  Create new registers with 1 region
######################################################################################
  Scenario: POST Status Code 201 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions'
    And   format only a region
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data


######################################################################################
#   POST: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions
#     --->  Create new registers with 2 regions
######################################################################################
  Scenario: POST Status Code 201 for path '/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<contractId>/regions'
    And   format two regions
    When  POST in carriers-contracts-regions passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Carriers-contracts-regions should contain valid data


######################################################################################
#   POST: /aldebaran-carriers/carriers/{cnpj}/contracts/{branch}/{contractId}/regions
#    ---> Invalid authentication
######################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Username
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    And   format only a region
    When  POST in carriers-contracts-regions passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Username
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    And   format only a region
    When  POST in carriers-contracts-regions passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    And   format only a region
    When  POST in carriers-contracts-regions passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    And   format only a region
    When  POST in carriers-contracts-regions passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"
