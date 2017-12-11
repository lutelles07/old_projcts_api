@ready @carriers_api @carriers
Feature: Endpoint Aldebaran Carriers

#*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @carriersAPI --format html --out reports/carriers.html
#*************************************************************************************************************

###############################################################################
# POST: /aldebaran-carriers/carriers/<cnpj>
###############################################################################
  #@run_10_times
  Scenario: POST Status Code 201 for path '/aldebaran-carriers/carriers/<cnpj>'
    Given I create a body containing valid data
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "name" (String / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "name"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null name for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "name" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "name"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty name for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "name" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "label" (String / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "label"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null label for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "label" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering an empty "label"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty label for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "label" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


####################################################################################
#  POST: VALIDATE FIELD "occurrenceType" (String / Required / Should be "P" or "C")
####################################################################################

#----------------------------------------------------#
#    ---> Entering a null "occurrenceType"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null occurrenceType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "occurrenceType" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "occurrenceType"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty occurrenceType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "occurrenceType" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering "C" value in "occurrenceType"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "C" in occurrenceType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "occurrenceType" equal "C" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering "P" value in "occurrenceType"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "P" in occurrenceType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "occurrenceType" equal "P" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering an invalid value in "occurrenceType"
#----------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid occurrenceType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "occurrenceType" equal "X" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_ocorrencia tem valor inválido"


######################################################################################
#  POST: VALIDATE FIELD "isActive" (Boolean / Required / Should be "true" or "false")
######################################################################################

#----------------------------------------------------#
#    ---> Entering a null "isActive"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null isActive for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "isActive" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "isActive"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null isActive for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "isActive" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering false value in "isActive"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in isActive for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "isActive" equal "false" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering true value in "isActive"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in isActive for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "isActive" equal "true" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "insurance/type" (String / Required)
# - Should be:
#  "T"	Transportadora
#  "C"	Contrato
#  "F"	Frete
#  "R"	Região
#  "D"	Detalhe Frete
#  "N"	Não se aplica
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "insurance/type"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty insurance/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "null" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "insurance/type"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty insurance/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "empty" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an invalid "insurance/type"
#----------------------------------------------------#
  Scenario: POST Status Code 422: Enter an empty insurance/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "X" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_taxa_seguro tem valor inválido"

#----------------------------------------------------#
#    ---> Entering "T" value in "insurance/type"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "T" value in insurance/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "T" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering "C" value in "insurance/type"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "C" value in insurance/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "C" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering "F" value in "insurance/type"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "F" value in insurance/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "F" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering "R" value in "insurance/type"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "R" value in insurance/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "R" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering "D" value in "insurance/type"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "D" value in insurance/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "D" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering "N" value in "insurance/type"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "N" value in insurance/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "N" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "insurance/amount" (Float / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "insurance/amount"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty insurance/amount for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "amount" equal "null" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "insurance/amount"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty insurance/amount for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "amount" equal "empty" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an invalid "insurance/amount"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty insurance/amount for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "amount" equal "X" in the block "insurance"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "sourceId" (String / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "sourceId"
#----------------------------------------------------#
  Scenario: POST Status Code 422: Enter a null sourceId for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "sourceId" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Campo 'ID_FONTE' é obrigatorio e esta nulo"

#----------------------------------------------------#
#    ---> Entering an empty "sourceId"
#----------------------------------------------------#
  Scenario: POST Status Code 422: Enter an empty sourceId for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "sourceId" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Campo 'ID_FONTE' é obrigatorio e esta nulo"

#----------------------------------------------------#
#    ---> Entering an invalid "sourceId"
#----------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid sourceId for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "sourceId" equal "ABC" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "o encontrada"


###############################################################################
#  POST: VALIDATE FIELD "transitTimeType" (String / Optional)
# - Should be:
#  "E" - Estabelecimento
#  "C" - Contrato
#  "T" - Transportadora
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "transitTimeType"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null transitTimeType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transitTimeType" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering an empty "transitTimeType"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty transitTimeType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transitTimeType" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering an invalid "transitTimeType"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an invalid transitTimeType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transitTimeType" equal "X" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tp_transit_time tem valor inválido"

#----------------------------------------------------#
#    ---> Entering "E" value in "transitTimeType"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "E" value in transitTimeType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transitTimeType" equal "E" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering "C" value in "transitTimeType"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "C" value in transitTimeType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transitTimeType" equal "C" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering "T" value in "transitTimeType"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter "T" value in transitTimeType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transitTimeType" equal "T" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


#######################################################################################################
#  POST: VALIDATE FIELD "saveDate" (DateTime / Required) - Should be in the format YYYY-MM-DDTHH-MM-SS
#######################################################################################################

#----------------------------------------------------#
#    ---> Entering a null "saveDate"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "saveDate" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "saveDate"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "saveDate" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an invalid "saveDate"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "saveDate" equal "2015/10/06T11:23:38" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "saveDate" equal "2015/02/29T11:23:38" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "saveDate" equal "2015/03/32T11:23:38" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "saveDate" equal "2015/09/31T11:23:38" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an invalid format "saveDate"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid format in saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "saveDate" equal "06-10-2016T11:23:38" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "saveDate" equal "29-02-2016T11:23:38" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "saveDate" equal "32-03-2016T11:23:38" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "saveDate" equal "31-09-2016T11:23:38" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "goals/delay" (Float / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "goals/delay"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "delay" equal "null" in the block "goals"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "goals/delay"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "delay" equal "empty" in the block "goals"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an invalid "goals/delay"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a an invalid saveDate for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "delay" equal "3G" in the block "goals"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "hasOwnFleet" (boolean / Optional)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "hasOwnFleet"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null hasOwnFleet for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "hasOwnFleet" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering an empty "hasOwnFleet"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty hasOwnFleet for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "hasOwnFleet" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering true value in "hasOwnFleet"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in hasOwnFleet for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "hasOwnFleet" equal "true" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------#
#    ---> Entering false value in "hasOwnFleet"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in hasOwnFleet for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "hasOwnFleet" equal "false" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


##################################################################################################
#  POST: VALIDATE FIELD "freightCalculation/gatheringRate/considerOnFreight" (boolean / Required)
##################################################################################################

#----------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/gatheringRate/considerOnFreight"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/gatheringRate/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "null" in the block "gatheringRate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/gatheringRate/considerOnFreight"
#-----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightCalculation/gatheringRate/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "empty" in the block "gatheringRate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "freightCalculation/gatheringRate/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty freightCalculation/gatheringRate/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "true" in the block "gatheringRate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "freightCalculation/gatheringRate/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty freightCalculation/gatheringRate/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "false" in the block "gatheringRate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################################
#  POST: VALIDATE FIELD "freightCalculation/adValorem/considerOnFreight" (boolean / Required)
###############################################################################################

#----------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/adValorem/considerOnFreight"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/adValorem/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "null" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/adValorem/considerOnFreight"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightCalculation/adValorem/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "empty" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------------------------------#
#    ---> Entering an invalid "freightCalculation/adValorem/considerOnFreight"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid freightCalculation/adValorem/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "X" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------------------------------#
#    ---> Entering true value in "freightCalculation/adValorem/considerOnFreight"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter true in freightCalculation/adValorem/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "true" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_advalorem = S, tipo_advalorem não pode ser diferente de S ou A"

#----------------------------------------------------------------------------------#
#    ---> Entering false value in "freightCalculation/adValorem/considerOnFreight"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter false in freightCalculation/adValorem/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "false" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "freightCalculation/adValorem/type" (string / Required)
# - Should be:
#  "N" - Não se aplica. (deve ter esse valor apenas se considerOnFreight seja false)
#  "S" - Somado ao preço peso/m3
#  "L" - Com limite de isenção (somado)
#  "A" - Ao invés do preço peso/m3
#  "I" - Com limite de isenção (ao inv)
###############################################################################

#----------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/adValorem/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/adValorem/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "null" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/adValorem/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightCalculation/adValorem/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "empty" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------------------------------#
#    ---> Entering "N" value in "freightCalculation/adValorem/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "N" value in freightCalculation/adValorem/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "N" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------------------------------------#
#    ---> Entering "S" value in "freightCalculation/adValorem/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "S" value in freightCalculation/adValorem/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "S" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_advalorem = N, tipo_advalorem não pode ser diferente de N"

#----------------------------------------------------------------------------------#
#    ---> Entering "L" value in "freightCalculation/adValorem/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "L" value in freightCalculation/adValorem/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "L" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_advalorem = N, tipo_advalorem não pode ser diferente de N"

#----------------------------------------------------------------------------------#
#    ---> Entering "A" value in "freightCalculation/adValorem/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "A" value in freightCalculation/adValorem/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "A" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_advalorem = N, tipo_advalorem não pode ser diferente de N"

#----------------------------------------------------------------------------------#
#    ---> Entering "I" value in "freightCalculation/adValorem/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "I" value in freightCalculation/adValorem/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "I" in the block "adValorem"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_advalorem = N, tipo_advalorem não pode ser diferente de N"


#########################################################################################
#  POST: VALIDATE FIELD "freightCalculation/toll/considerOnFreight" (boolean / Required)
#########################################################################################

#----------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/toll/considerOnFreight"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/toll/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "null" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/toll/considerOnFreight"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightCalculation/toll/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "empty" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------------------------------#
#    ---> Entering true value in "freightCalculation/toll/considerOnFreight"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter true value in freightCalculation/toll/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "true" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_pedagio = S, tipo_pedagio não pode ser diferente de C, R, F"

#----------------------------------------------------------------------------------#
#    ---> Entering false value in "freightCalculation/toll/considerOnFreight"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in freightCalculation/toll/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "false" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

###############################################################################
#  POST: VALIDATE FIELD "freightCalculation/toll/type" (string / Required)
# - Should be:
#  "N" - Não se aplica. (deve ter esse valor apenas se considerOnFreight seja false)
#  "C" - Cabeçalho da tabela
#  "R" - Região de destino
#  "F" - Fração de peso
###############################################################################

#----------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/toll/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/toll/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "null" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/toll/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/toll/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "empty" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------------------------------#
#    ---> Entering an invalid value in "freightCalculation/toll/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid value in freightCalculation/toll/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "X" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_pedagio tem valor inválido  - Se in_pedagio = N, tipo_pedagio não pode ser diferente de N"

#----------------------------------------------------------------------------------#
#    ---> Entering "N" value in "freightCalculation/toll/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "N" value in freightCalculation/toll/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "N" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#----------------------------------------------------------------------------------#
#    ---> Entering "C" value in "freightCalculation/toll/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "C" value in freightCalculation/toll/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "C" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_pedagio = N, tipo_pedagio não pode ser diferente de N"

#----------------------------------------------------------------------------------#
#    ---> Entering "R" value in "freightCalculation/toll/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "R" value in freightCalculation/toll/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "R" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_pedagio = N, tipo_pedagio não pode ser diferente de N"

#----------------------------------------------------------------------------------#
#    ---> Entering "F" value in "freightCalculation/toll/type"
#----------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "F" value in freightCalculation/toll/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "F" in the block "toll"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_pedagio = N, tipo_pedagio não pode ser diferente de N"


##################################################################################################
#  POST: VALIDATE FIELD "freightCalculation/minimumWeight/considerOnFreight" (boolean / Required)
##################################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/minimumWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/minimumWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "null" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/minimumWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/minimumWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "empty" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering "X" value in "freightCalculation/minimumWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/minimumWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "X" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "freightCalculation/minimumWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in freightCalculation/minimumWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "true" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "freightCalculation/minimumWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in freightCalculation/minimumWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "false" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


#######################################################################################
#  POST: VALIDATE FIELD "freightCalculation/minimumWeight/type" (string / Required)
# - Should be:
# "N" - Não se aplica.(deve ter esse valor apenas se considerOnFreight seja false)
# "D" - Peso Declarado
# "C" - Peso Cubado
# "A" - Ambos
#######################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/minimumWeight/type"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/minimumWeight/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "null" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/minimumWeight/type"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/minimumWeight/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "empty" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid value in "freightCalculation/minimumWeight/type"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid freightCalculation/minimumWeight/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "X" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_peso_minimo tem valor inválido"

#-------------------------------------------------------------------------------------#
#    ---> Entering "N" value in "freightCalculation/minimumWeight/type"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "N" value in freightCalculation/minimumWeight/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "N" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "D" value in "freightCalculation/minimumWeight/type"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "D" value in freightCalculation/minimumWeight/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "D" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "C" value in "freightCalculation/minimumWeight/type"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "C" value in freightCalculation/minimumWeight/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "C" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "A" value in "freightCalculation/minimumWeight/type"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "A" value in freightCalculation/minimumWeight/type for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "A" in the block "minimumWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


################################################################################################
#  POST: VALIDATE FIELD "freightCalculation/cubedWeight/considerOnFreight" (boolean / Required)
################################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "null" in the block "cubedWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "empty" in the block "cubedWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "true" in the block "cubedWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "false" in the block "cubedWeight"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


##################################################################################################
#  POST: VALIDATE FIELD "freightCalculation/minimumAmount/considerOnFreight" (boolean / Required)
##################################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "null" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "empty" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an empty freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "true" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_valor_minimo = S, tipo_valor_minimo não pode ser diferente de M,C,D"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "false" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "freightCalculation/minimumAmount/considerOnFreight" (string / Required)
# - Should be:
#  "N" - Não se aplica.
#  "M" - Multiplicado pelo peso
#  "C" - Cabeçalho da tabela
#  "D" - Faixa de peso da tabela
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "null" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "empty" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "X" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_valor_minimo tem valor inválido  - Se in_valor_minimo = N, tipo_valor_minimo não pode ser diferente de N"

#-------------------------------------------------------------------------------------#
#    ---> Entering "N" value in "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "N" value in freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "N" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "M" value in "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "M" value in freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "M" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_valor_minimo = N, tipo_valor_minimo não pode ser diferente de N"

#-------------------------------------------------------------------------------------#
#    ---> Entering "C" value in "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "C" value in freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "C" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_valor_minimo = N, tipo_valor_minimo não pode ser diferente de N"

#-------------------------------------------------------------------------------------#
#    ---> Entering "D" value in "freightCalculation/cubedWeight/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "D" value in freightCalculation/cubedWeight/considerOnFreight for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "D" in the block "minimumAmount"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Se in_valor_minimo = N, tipo_valor_minimo não pode ser diferente de N"


###############################################################################
#  POST: VALIDATE FIELD "freightCalculation/redelivery" (string / Required)
# - Should be:
# "P"	Percentual
# "V"	Valor definido (fixo)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/redelivery"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "null" in the block "redelivery"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/redelivery"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "empty" in the block "redelivery"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "freightCalculation/redelivery"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "X" in the block "redelivery"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_reentrega tem valor inválido"

#-------------------------------------------------------------------------------------#
#    ---> Entering "P" value in "freightCalculation/redelivery"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "P" value in freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "P" in the block "redelivery"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "V" value in "freightCalculation/redelivery"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "P" value in freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "V" in the block "redelivery"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "freightCalculation/return" (string / Required)
# - Should be:
# "P" - Percentual
# "V" - Valor definido (fixo)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "freightCalculation/return"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "null" in the block "return"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "freightCalculation/return"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "empty" in the block "return"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "freightCalculation/return"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "X" in the block "return"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_devolucao tem valor inválido"

#-------------------------------------------------------------------------------------#
#    ---> Entering "P" value in "freightCalculation/return"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "P" value in freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "P" in the block "return"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "V" value in "freightCalculation/return"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "V" value in freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "V" in the block "return"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


#########################################################################################
#  POST: VALIDATE FIELD "maximumAmountPerInvoice/considerOnFreight" (boolean / Required)
#########################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "maximumAmountPerInvoice/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "null" in the block "maximumAmountPerInvoice"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "maximumAmountPerInvoice/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "empty" in the block "maximumAmountPerInvoice"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "maximumAmountPerInvoice/considerOnFreight"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid freightCalculation/redelivery for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "considerOnFreight" equal "X" in the block "maximumAmountPerInvoice"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "issuesCTRC" (boolean / Required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "issuesCTRC"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null issuesCTRC for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "issuesCTRC" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "issuesCTRC"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty issuesCTRC for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "issuesCTRC" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "issuesCTRC"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid issuesCTRC for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "issuesCTRC" equal "X" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "issuesCTRC"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in issuesCTRC for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "issuesCTRC" equal "true" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "issuesCTRC"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in issuesCTRC for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "issuesCTRC" equal "false" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "transportationMeanType" (string / Optional)
# - Should be:
#  "R" - Terrestre
#  "A" - Aéreo
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "transportationMeanType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null transportationMeanType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transportationMeanType" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "transportationMeanType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty transportationMeanType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transportationMeanType" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "transportationMeanType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid transportationMeanType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transportationMeanType" equal "X" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_meio_transporte tem valor inválido"

#-------------------------------------------------------------------------------------#
#    ---> Entering "R" value in "transportationMeanType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "R" value in transportationMeanType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transportationMeanType" equal "R" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "A" value in "transportationMeanType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "A" value in transportationMeanType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "transportationMeanType" equal "A" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "serviceMakerType" (string / Required)
# - Should be:
#  "R" - Remetente
#  "D" - Destinatário
#  "C" - Consignatário
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "serviceMakerType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null serviceMakerType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "serviceMakerType" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "serviceMakerType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty serviceMakerType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "serviceMakerType" equal "empty" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "serviceMakerType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid serviceMakerType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "serviceMakerType" equal "X" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_tomador_servico tem valor inválido"

#-------------------------------------------------------------------------------------#
#    ---> Entering "R" value in "serviceMakerType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "R" value in serviceMakerType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "serviceMakerType" equal "R" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "D" value in "serviceMakerType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "D" value in serviceMakerType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "serviceMakerType" equal "D" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "C" value in "serviceMakerType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "C" value in serviceMakerType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "serviceMakerType" equal "C" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "icmsTaxPayer" (boolean / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "icmsTaxPayer"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null icmsTaxPayer for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "icmsTaxPayer" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "icmsTaxPayer"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty icmsTaxPayer for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "icmsTaxPayer" equal "null" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "icmsTaxPayer"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in icmsTaxPayer for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "icmsTaxPayer" equal "true" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "icmsTaxPayer"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in icmsTaxPayer for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "icmsTaxPayer" equal "false" in the block "root"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


##########################################################################################
#  POST: VALIDATE FIELD "partnerData/cnpj" (integer / optional) - Should be a valid CNPJ
##########################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid (numeric) "partnerData/cnpj"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid partnerData/cnpj for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "cnpj" equal "integer" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Id_transportadora não é um CNPJ válido"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid (alphanumeric) "partnerData/cnpj"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid partnerData/cnpj for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "cnpj" equal "2331730300013G" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/name" (string / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/name"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/name for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "name" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/name"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/name for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "name" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/legalEntityType" (integer / required)
# - Should be:
#  1 - Pessoa Jurídica
#  2 - Pessoa Física no País
#  3 - Pessoa Jurídica no Exterior
#  4 - Pessoa Jurídica SUFRAMA
#  5 - Pessoa Juridica no País sem I.E
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/legalEntityType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/legalEntityType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "legalEntityType" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/legalEntityType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty partnerData/legalEntityType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "legalEntityType" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid (numeric) "partnerData/legalEntityType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid partnerData/legalEntityType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "legalEntityType" equal "8" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_cliente tem valor inválido"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid (alphanumeric) "partnerData/legalEntityType"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid partnerData/legalEntityType for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "legalEntityType" equal "string" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/stateRegistration" (string / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/stateRegistration"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/stateRegistration for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "stateRegistration" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering a empty "partnerData/stateRegistration"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/stateRegistration for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "stateRegistration" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/notes" (string / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/notes"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/notes for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "notes" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/notes"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/notes for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "notes" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering a string "partnerData/notes"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/notes for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "notes" equal "Está é a Observação" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering random string "partnerData/notes"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/notes for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "notes" equal "string" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/phoneNumber" (string / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/phoneNumber"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/notes for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "phoneNumber" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/phoneNumber"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/notes for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "phoneNumber" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "partnerData/phoneNumber"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an invalid partnerData/notes for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "phoneNumber" equal "12345890GD" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/contact" (string / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/contact"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/contact for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "contact" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/contact"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a nan empty partnerData/contact for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "contact" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/email" (string / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/email"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/email for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "email" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/email"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/email for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "email" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "partnerData/email"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an invalid partnerData/email for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "email" equal "joao@@gmail..com" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/isActive" (string / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/isActive"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/address/isActive for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "isActive" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/address/isActive"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty partnerData/address/isActive for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "isActive" equal "empty" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "partnerData/address/isActive"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in partnerData/address/isActive for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "isActive" equal "true" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "partnerData/address/isActive"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in partnerData/address/isActive for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "isActive" equal "false" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/sequence" (Integer / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/sequence"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/address/sequence for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "sequence" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/address/sequence"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/address/sequence for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "sequence" equal "empty" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "partnerData/address/sequence"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/address/sequence for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "sequence" equal "X" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering a numberic value "partnerData/address/sequence"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/address/sequence for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "sequence" equal "integer" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/type" (String / required)
# - Should be:
#  "C" - Cobrança
#  "E" - Entrega
#  "F" - Faturamento
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/sequence"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/address/sequence for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/address/sequence"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty partnerData/address/sequence for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "empty" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "partnerData/address/sequence"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid partnerData/address/sequence for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "X" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "tipo_endereco tem valor inválido"

#-------------------------------------------------------------------------------------#
#    ---> Entering "C" value in  "partnerData/address/sequence"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "C" value in partnerData/address/sequence for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "C" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "E" value in  "partnerData/address/sequence"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "E" value in partnerData/address/sequence for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "E" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering "F" value in  "partnerData/address/sequence"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "F" value in partnerData/address/sequence for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "type" equal "F" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/street" (String / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/street"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/address/street for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "street" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/address/street"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty partnerData/address/street for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "street" equal "empty" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/number" (Integer / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/number"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/address/number for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "number" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/address/number"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty partnerData/address/number for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "number" equal "empty" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an valid "partnerData/address/number"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an invalid partnerData/address/number for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "number" equal "integer" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/zipCode" (Integer / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/zipCode"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/address/zipCode for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "zipCode" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/zipCode"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/address/zipCode for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "zipCode" equal "empty" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering a valid "partnerData/address/zipCode"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a valid partnerData/address/zipCode for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "zipCode" equal "integer" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/neighborhood" (String / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/neighborhood"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/address/neighborhood for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "neighborhood" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/address/neighborhood"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/address/neighborhood for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "neighborhood" equal "empty" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering a valid "partnerData/address/neighborhood"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/address/neighborhood for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "neighborhood" equal "Santa Cecília" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/complement" (String / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/complement"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/address/complement for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "complement" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/address/complement"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/address/complement for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "complement" equal "empty" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering a valid "partnerData/address/complement"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a valid partnerData/address/complement for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "complement" equal "Apartamento" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/reference" (String / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/reference"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/address/reference for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "reference" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/reference"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/address/reference for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "reference" equal "empty" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering a valid "partnerData/address/reference"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/address/reference for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "reference" equal "Ref01" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/cityNumber" (String / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/cityNumber"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/address/reference for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "cityNumber" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/address/cityNumber"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty partnerData/address/reference for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "cityNumber" equal "empty" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "partnerData/address/cityNumber"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid partnerData/address/reference for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "cityNumber" equal "integer" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "id_municipio tem valor inválido - UF do município  está nula"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/address/ean" (Integer / optional)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/address/ean"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/address/ean for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "ean" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/address/ean"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/address/ean for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "ean" equal "null" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering a valid "partnerData/address/ean"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/address/ean for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "ean" equal "integer" in the block "address"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/lockedFlag" (Boolean / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/lockedFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/lockedFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "lockedFlag" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/lockedFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty partnerData/lockedFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "lockedFlag" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "partnerData/lockedFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in partnerData/lockedFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "lockedFlag" equal "true" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "partnerData/lockedFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in partnerData/lockedFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "lockedFlag" equal "false" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/registryFlag" (Boolean / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/registryFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/registryFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "registryFlag" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/registryFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty partnerData/registryFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "registryFlag" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "partnerData/registryFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid partnerData/registryFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "registryFlag" equal "X" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "partnerData/registryFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in partnerData/registryFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "registryFlag" equal "true" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "partnerData/registryFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in partnerData/registryFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "registryFlag" equal "false" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST:  VALIDATE FIELD "partnerData/wonCopyFlag" (Boolean / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/wonCopyFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/wonCopyFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "wonCopyFlag" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/wonCopyFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null partnerData/wonCopyFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "wonCopyFlag" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "partnerData/wonCopyFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in partnerData/wonCopyFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "wonCopyFlag" equal "true" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "partnerData/wonCopyFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in partnerData/wonCopyFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "wonCopyFlag" equal "false" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/wonInterestFlag" (Boolean / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/wonInterestFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/wonInterestFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "wonInterestFlag" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/wonInterestFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty partnerData/wonInterestFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "wonInterestFlag" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "partnerData/wonInterestFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in partnerData/wonInterestFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "wonInterestFlag" equal "true" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "partnerData/wonInterestFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in partnerData/wonInterestFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "wonInterestFlag" equal "false" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "partnerData/interestFlag" (Boolean / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "partnerData/interestFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/interestFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "interestFlag" equal "null" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "partnerData/interestFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null partnerData/interestFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "interestFlag" equal "empty" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering true value in "partnerData/interestFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in partnerData/interestFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "interestFlag" equal "true" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"

#-------------------------------------------------------------------------------------#
#    ---> Entering false value in "partnerData/interestFlag"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in partnerData/interestFlag for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "interestFlag" equal "false" in the block "partnerData"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: VALIDATE FIELD "trackingUpdate/user" (String / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/user"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null trackingUpdate/user for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "user" equal "null" in the block "trackingUpdate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/user"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty trackingUpdate/user for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "user" equal "empty" in the block "trackingUpdate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


########################################################################################################
#  POST: VALIDATE FIELD "trackingUpdate/dateTime" (DateTime / required) - Should be YYYY-MM-DDTHH:MM:SS
########################################################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/user"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "dateTime" equal "null" in the block "trackingUpdate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/user"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "dateTime" equal "empty" in the block "trackingUpdate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "trackingUpdate/user"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "dateTime" equal "2015/10/06T11:23:38" in the block "trackingUpdate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  POST: VALIDATE FIELD "trackingUpdate/version" (Integer / required)
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/version"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null trackingUpdate/version for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "version" equal "null" in the block "trackingUpdate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/version"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty trackingUpdate/version for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "version" equal "empty" in the block "trackingUpdate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering an invalid "trackingUpdate/version"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty trackingUpdate/version for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "version" equal "string" in the block "trackingUpdate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------------------------#
#    ---> Entering a valid "trackingUpdate/version"
#-------------------------------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a valid trackingUpdate/version for path "/aldebaran-carriers/carriers/<cnpj>"
    Given Entering in carrier body the field "version" equal "integer" in the block "trackingUpdate"
    When  POST in carriers passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And  I should see the message "incluida com sucesso"


###############################################################################
#  POST: /aldebaran-carriers/carriers/<cnpj>
#    ---> Invalid authentication
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Username
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    Given I create a body containing valid data
    When  POST in carriers passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    Given I create a body containing valid data
    When  POST in carriers passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Invalid Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    Given I create a body containing valid data
    When  POST in carriers passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    Given I create a body containing valid data
    When  POST in carriers passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"
