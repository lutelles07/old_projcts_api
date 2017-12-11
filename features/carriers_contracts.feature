@ready @carriers @carriers_contracts
Feature: Endpoint Aldebaran Carriers-Contracts

#*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @carriersContracts --format html --out reports/carriers_contracts.html
#*************************************************************************************************************

  Background:
    Given GET cnpj carriers from database

###############################################################################
# POST: /aldebaran-carriers/carriers/{cnpj}/contracts
###############################################################################
  Scenario: POST Status Code 201 for path '/aldebaran-carriers/carriers/<cnpj>/contracts'
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "branch" (Integer / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "branch"
#----------------------------------------------------#
Scenario: POST Status Code 422: Enter a null branch for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "branch" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "É preciso informar o estabelecimento! / Erro ao validar tomador"

#----------------------------------------------------#
#    ---> Entering an empty "branch"
#----------------------------------------------------#
  Scenario: POST Status Code 422: Enter an empty branch for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "branch" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "É preciso informar o estabelecimento! / Erro ao validar tomador"

#----------------------------------------------------#
#    ---> Entering an invalid "branch"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid branch for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "branch" equal "F" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering a valid "branch"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a valid branch for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "branch" equal "integer" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "name" (String / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "name"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null name for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "name" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "name"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty name for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "name" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering a valid "name"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a valid name for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "name" equal "string" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "isActive" (Boolean / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "isActive"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null name for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isActive" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "isActive"
#----------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null name for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isActive" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering true value in "isActive"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null name for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isActive" equal "true" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#----------------------------------------------------#
#    ---> Entering false value in "isActive"
#----------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null name for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isActive" equal "false" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


#######################################################################################
#  POST: VALIDATE FIELD "effectiveDates/start" (Date / Required)  - Format: YYYY-MM-DD
#######################################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "effectiveDates/start"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null effectiveDates/start for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "null" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------#
#    ---> Entering an empty "effectiveDates/start"
#-------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty effectiveDates/start for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "empty" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#--------------------------------------------------------------#
#    ---> Entering an invalid format "effectiveDates/start"
#--------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid format for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "2013/11/30" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "2013/02/30" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "2013/02/29" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "2013/03/33" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#--------------------------------------------------------------#
#    ---> Entering an invalid format "effectiveDates/start"
#--------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid format for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "30-11-2013" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#--------------------------------------------------------------#
#    ---> Entering (startDate < dueTo) "effectiveDates/start" - in the CURRENT century
#--------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a "startDate" less than "dueTo" for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "2001-02-04" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


#--------------------------------------------------------------#
#    ---> Entering (startDate > dueTo) "effectiveDates/start"
#--------------------------------------------------------------#
  Scenario: POST Status Code 422: Enter a "startDate" greater than "dueTo" for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "2019-07-04" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "A data inicial não pode ser posterior à data final"


######################################################################################
#  POST: VALIDATE FIELD "effectiveDates/dueTo" (Date / Required) - Format: YYYY-MM-DD
######################################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "effectiveDates/dueTo"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "null" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "effectiveDates/dueTo"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "empty" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid format "effectiveDates/dueTo"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid format effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2013/11/30" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2013/02/30" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2013/02/29" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2013/03/33" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid format "effectiveDates/dueTo"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid format effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "30-11-2013" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering (dueTo > startDate) "effectiveDates/dueTo"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a "dueTo" greater than "startDate" for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2015-06-04" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#-----------------------------------------------------------#
#    ---> Entering (dueTo < startDate) "effectiveDates/dueTo" - in the CURRENT century
#-----------------------------------------------------------#
  Scenario: POST Status Code 422: Enter a "dueTo" less than "startDate" for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2001-07-04" in the block "effectiveDates"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "A data inicial não pode ser posterior à data final"


###############################################################################
#  POST: VALIDATE FIELD "externalLabel" (String / Required)
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "externalLabel"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null externalLabel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "externalLabel" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "externalLabel"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty externalLabel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "externalLabel" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering a valid "externalLabel"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a valid externalLabel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "externalLabel" equal "string" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "freightCalculationDocument" (String / Required) -
#  Should be:
#  "N" - Nota Fiscal
#  "V" - Volume
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "freightCalculationDocument"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightCalculationDocument for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightCalculationDocument" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "freightCalculationDocument"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightCalculationDocument for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightCalculationDocument" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid "freightCalculationDocument"
#-----------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid freightCalculationDocument for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightCalculationDocument" equal "P" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "O valor do docto frete deve ser V(Volume) ou N(Nota Fiscal)"

#-----------------------------------------------------------#
#    ---> Entering "N" value in "externalLabel"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "N" value in freightCalculationDocument for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightCalculationDocument" equal "N" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#-----------------------------------------------------------#
#    ---> Entering "V" value in "freightCalculationDocument"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "V" value in freightCalculationDocument for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightCalculationDocument" equal "V" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "freightPayer/type" (String / Required) -
#  Should be:
#  "R" - Remetente
#  "D" - Destinatário
#  "C" - cfr. Contrato
#  "N" - Não se aplica
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "null" in the block "freightPayer"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "empty" in the block "freightPayer"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an empty freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "X" in the block "freightPayer"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "O valor do tipo tomador deve ser R(Remetente), D(Destinatário), C(Cfr. Contrato) ou N(Não se aplica) / Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering "R" value in "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "R" value in freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "R" in the block "freightPayer"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering "D" value in "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: POST Status Code 422: Enter "D" value in freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "D" in the block "freightPayer"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering "C" value in "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "C" value in freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "C" in the block "freightPayer"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#-----------------------------------------------------------#
#    ---> Entering "N" value in "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "N" value in freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "N" in the block "freightPayer"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"


###############################################################################
#  POST: VALIDATE FIELD "freightPayer/cnpj" (Integer / Optional)
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "freightPayer/cnpj"
#-----------------------------------------------------------#
  Scenario: POST Status Code 422: Enter a null freightPayer/cnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "cnpj" equal "null" in the block "freightPayer"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "É preciso informar um tomador para o tipo C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering a null "freightPayer/cnpj"
#-----------------------------------------------------------#
  Scenario: POST Status Code 422: Enter a null freightPayer/cnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "cnpj" equal "empty" in the block "freightPayer"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "É preciso informar um tomador para o tipo C(Cfr. Contrato)"


###############################################################################
#  POST: VALIDATE FIELD "deliveryType" (Integer / Required) -
#  1  - Normal
#  2  - Expressa
#  3  - Econômica
#  5  - Agendada
#  9  - Postagem
#  10 - Transporte Dedicado
#  11 - Garantida
#  12 - CONCIERGE
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "deliveryType"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "deliveryType"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid (alphanumeric) "deliveryType"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "H" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid (numeric) "deliveryType"
#-----------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "integer" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Não há registro do tipo de entrega:"


###############################################################################
#  POST: VALIDATE FIELD "transportType" (Integer / Required) -
#  1 - Leve
#  2 - Pesado
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "transportType"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "transportType" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "transportType"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "transportType" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid "transportType"
#-----------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "transportType" equal "integer" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Tipo de transporte não cadastrado!"


###############################################################################
#  POST: VALIDATE FIELD "isShipment" (Boolean / Required)
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "isShipment"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null isShipment for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isShipment" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "isShipment"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty isShipment for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isShipment" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering true value in "isShipment"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in isShipment for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isShipment" equal "true" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#-----------------------------------------------------------#
#    ---> Entering false value in "isShipment"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in isShipment for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isShipment" equal "false" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "exchangeGatheringOnDelivery" (String / Required)
#  Should be:
# "N" - Não faz Troca Casada
# "A" - Regiões Apontadas
# "T" - Todas as Regiões
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null isShipment for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty isShipment for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: POST Status Code 422: Enter an invalid isShipment for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "X" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "O valor da troca casada deve ser T(Todas as Regiões), A(Regiões Apontadas) ou N(Não faz troca casada)"

#-----------------------------------------------------------#
#    ---> Entering "N" value in "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "N" value in isShipment for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "N" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#-----------------------------------------------------------#
#    ---> Entering "A" value in "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "A" value in isShipment for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "A" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#-----------------------------------------------------------#
#    ---> Entering "T" value in "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter "T" value in isShipment for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "T" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "sourceId" (String / Optional)
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "sourceId"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null sourceId for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sourceId" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#-----------------------------------------------------------#
#    ---> Entering an empty "sourceId"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty sourceId for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sourceId" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#-----------------------------------------------------------#
#    ---> Entering an invalid "sourceId"
#-----------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty sourceId for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sourceId" equal "ABC" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Erro ao validar fonte ORA-20000: Fonte"


###############################################################################
#  POST: VALIDATE FIELD "invoiceIssuerCnpj" (Integer / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "invoiceIssuerCnpj"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null invoiceIssuerCnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "invoiceIssuerCnpj" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#--------------------------------------------------------------#
#    ---> Entering an empty "invoiceIssuerCnpj"
#--------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty invoiceIssuerCnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "invoiceIssuerCnpj" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an invalid (alphanumeric) "invoiceIssuerCnpj"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid invoiceIssuerCnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "invoiceIssuerCnpj" equal "string" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering a valid cnpj in "invoiceIssuerCnpj"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a valid cnpj in for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "invoiceIssuerCnpj" equal "faker" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "isOrs" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "isOrs"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null isOrs for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isOrs" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an empty "isOrs"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty isOrs for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isOrs" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering true value in "isOrs"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in isOrs for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isOrs" equal "true" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering false value in "isOrs"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in isOrs for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isOrs" equal "false" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "worksOn/saturdays" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "worksOn/saturdays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null worksOn/saturdays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "saturdays" equal "null" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an empty "worksOn/saturdays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty worksOn/saturdays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "saturdays" equal "empty" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering true value in "worksOn/saturdays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in worksOn/saturdays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "saturdays" equal "true" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering false value in "worksOn/saturdays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in worksOn/saturdays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "saturdays" equal "false" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "worksOn/sundays" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "worksOn/sundays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null worksOn/sundays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sundays" equal "null" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an empty "worksOn/sundays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty worksOn/sundays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sundays" equal "empty" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering true value in "worksOn/sundays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in worksOn/sundays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sundays" equal "true" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering false value in "worksOn/sundays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in worksOn/sundays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sundays" equal "false" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "worksOn/holidays" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "worksOn/holidays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null worksOn/holidays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "holidays" equal "null" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an empty "worksOn/holidays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty worksOn/holidays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "holidays" equal "empty" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering true value in "worksOn/holidays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in worksOn/holidays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "holidays" equal "true" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering false value in "worksOn/holidays"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in worksOn/holidays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "holidays" equal "false" in the block "worksOn"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "isInternationalFreightForwarder" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "isInternationalFreightForwarder"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null isInternationalFreightForwarder for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isInternationalFreightForwarder" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an empty "isInternationalFreightForwarder"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty isInternationalFreightForwarder for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isInternationalFreightForwarder" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering true value in "isInternationalFreightForwarder"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in isInternationalFreightForwarder for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isInternationalFreightForwarder" equal "true" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering false value in "isInternationalFreightForwarder"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in isInternationalFreightForwarder for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isInternationalFreightForwarder" equal "false" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


#################################################################################
#  POST: VALIDATE FIELD "requestsIdentificationOfRecipient" (Boolean / Optional)
#################################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "requestsIdentificationOfRecipient"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null requestsIdentificationOfRecipient for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "requestsIdentificationOfRecipient" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an empty "requestsIdentificationOfRecipient"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null requestsIdentificationOfRecipient for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "requestsIdentificationOfRecipient" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering true value in "requestsIdentificationOfRecipient"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in requestsIdentificationOfRecipient for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "requestsIdentificationOfRecipient" equal "true" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering false value in "requestsIdentificationOfRecipient"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in requestsIdentificationOfRecipient for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "requestsIdentificationOfRecipient" equal "false" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "issuesIncomingInvoiceOnGathering" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "issuesIncomingInvoiceOnGathering"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null issuesIncomingInvoiceOnGathering for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "issuesIncomingInvoiceOnGathering" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an empty "issuesIncomingInvoiceOnGathering"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null issuesIncomingInvoiceOnGathering for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "issuesIncomingInvoiceOnGathering" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering true value in "issuesIncomingInvoiceOnGathering"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in issuesIncomingInvoiceOnGathering for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "issuesIncomingInvoiceOnGathering" equal "true" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering false value in "issuesIncomingInvoiceOnGathering"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in issuesIncomingInvoiceOnGathering for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "issuesIncomingInvoiceOnGathering" equal "false" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "displaysDeliveriesOnControlPanel" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "displaysDeliveriesOnControlPanel"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null displaysDeliveriesOnControlPanel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "displaysDeliveriesOnControlPanel" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an empty displaysDeliveriesOnControlPanel"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null displaysDeliveriesOnControlPanel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "displaysDeliveriesOnControlPanel" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering true value in displaysDeliveriesOnControlPanel"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in displaysDeliveriesOnControlPanel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "displaysDeliveriesOnControlPanel" equal "true" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering false value in displaysDeliveriesOnControlPanel"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in displaysDeliveriesOnControlPanel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "displaysDeliveriesOnControlPanel" equal "false" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "standardDeadlineForOccurrences" (Integer / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "standardDeadlineForOccurrences"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null standardDeadlineForOccurrences for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "standardDeadlineForOccurrences" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an empty "standardDeadlineForOccurrences"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty standardDeadlineForOccurrences for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "standardDeadlineForOccurrences" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an invalid "standardDeadlineForOccurrences"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid standardDeadlineForOccurrences for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "standardDeadlineForOccurrences" equal "X" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering a numeric value "standardDeadlineForOccurrences"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a valid standardDeadlineForOccurrences for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "standardDeadlineForOccurrences" equal "integer" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "freightValuesWithoutIcms" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "freightValuesWithoutIcms"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null freightValuesWithoutIcms for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightValuesWithoutIcms" equal "null" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an empty "freightValuesWithoutIcms"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null freightValuesWithoutIcms for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightValuesWithoutIcms" equal "empty" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering true value in "freightValuesWithoutIcms"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter true value in freightValuesWithoutIcms for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightValuesWithoutIcms" equal "true" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering false value in "freightValuesWithoutIcms"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter false value in freightValuesWithoutIcms for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightValuesWithoutIcms" equal "false" in the block "root"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "trackingUpdate/user" (Boolean / Required)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/user"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null trackingUpdate/user for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "user" equal "null" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/user"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty trackingUpdate/user for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "user" equal "empty" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering a valid "trackingUpdate/user"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter a null trackingUpdate/user for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "user" equal "string" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data


###############################################################################
#  POST: VALIDATE FIELD "trackingUpdate/dateTime" (Boolean / Required)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter a null trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "null" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an empty trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "empty" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering a valid "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: POST Status Code 201: Enter an empty trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "2012-06-29T15:13:38" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "201"
    And   Verify if the response contains the field X-tid
    And   Validate carriers-contracts data

#---------------------------------------------------------------#
#    ---> Entering an invalid "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "2012/06/29T15:13:38" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering an invalid format in "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "04-08-2016T15:13:38" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "29-02-2016T15:13:38" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "33-03-2016T15:13:38" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: POST Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "31-09-2016T15:13:38" in the block "trackingUpdate"
    When  POST in carriers-contracts passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
# POST: /aldebaran-carriers/carriers/{cnpj}/contracts
#    ---> Invalid authentication
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering an Invalid Username
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    When  POST in carriers-contracts passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering an Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    When  POST in carriers-contracts passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering an Invalid Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    When  POST in carriers-contracts passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering an Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    When  POST in carriers-contracts passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"
