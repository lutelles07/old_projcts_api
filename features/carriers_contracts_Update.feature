@ready @carriers @carriers_contracts_update
Feature: Endpoint Aldebaran Carriers-Contracts-Update

#*************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @carriersContractsUpdate --format html --out reports/carriers_contracts_update.html
#*************************************************************************************************************

  Background:
    Given GET cnpj carriers-contracts-transportadoras from database

###############################################################################
#   PUT: /carriers/{cnpj}/contracts/{branch}/{id}
###############################################################################
  Scenario: PUT validate aldebaran body responses for path "/aldebaran-carriers/carriers/<cnpj>/contracts/<branch>/<id>"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "name" (String / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "name"
#----------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null name for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "name" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "name"
#----------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty name for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "name" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "isActive" (Boolean / Required)
###############################################################################

#----------------------------------------------------#
#    ---> Entering a null "isActive"
#----------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null isActive for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isActive" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------#
#    ---> Entering an empty "isActive"
#----------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty isActive for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isActive" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


#######################################################################################
#  PUT: VALIDATE FIELD "effectiveDates/start" (Boolean / Required) - Format: YYYY-MM-DD
#######################################################################################

#----------------------------------------------------------#
#    ---> Entering a null "effectiveDates/start"
#----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null effectiveDates/start for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "null" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "effectiveDates/start"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty effectiveDates/start for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "empty" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#------------------------------------------------------------#
#    ---> Entering an invalid format "effectiveDates/start"
#------------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid format effectiveDates/start for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "2013/11/30T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#------------------------------------------------------------#
#    ---> Entering an invalid format "effectiveDates/start"
#------------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid format effectiveDates/start for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "30-11-2013T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#------------------------------------------------------------#
#    ---> Entering an invalid format "effectiveDates/start"
#------------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter an invalid format effectiveDates/start for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "start" equal "2019-07-04T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "A data inicial não pode ser posterior à data final"


########################################################################################
#  PUT: VALIDATE FIELD "effectiveDates/dueTo" (Boolean / Required) - Format: YYYY-MM-DD
########################################################################################

#----------------------------------------------------------#
#    ---> Entering a null "effectiveDates/dueTo"
#----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "null" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------#
#    ---> Entering an empty "effectiveDates/dueTo"
#----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "empty" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------#
#    ---> Entering an invalid format "effectiveDates/dueTo"
#----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid format in effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2013/12/30T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400: Enter an invalid format in effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2013/02/30T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400: Enter an invalid format in effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2013/02/29T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400: Enter an invalid format in effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2013/03/33T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------#
#    ---> Entering an invalid format "effectiveDates/dueTo"
#----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid format in effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "30-12-2013T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#----------------------------------------------------------#
#    ---> Entering a valid "effectiveDates/dueTo"
#----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a valid effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2015-06-04T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data
@wip1
  Scenario: PUT Status Code 400: Enter a valid effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2015-02-29T00:00:00.00" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400: Enter a valid effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2015-02-30T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400: Enter a valid effectiveDates/dueTo for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dueTo" equal "2015-03-33T00:00:00.000Z" in the block "effectiveDates"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
#  PUT: VALIDATE FIELD "externalLabel" (String / Required)
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "externalLabel"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null externalLabel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "externalLabel" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "externalLabel"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty externalLabel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "externalLabel" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering a valid "externalLabel"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a valid externalLabel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "externalLabel" equal "string" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT VALIDATE FIELD "freightCalculationDocument" (String / Required) -
#  Should be:
#  "N" - Nota Fiscal
#  "V" - Volume
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "freightCalculationDocument"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null freightCalculationDocument for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightCalculationDocument" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "freightCalculationDocument"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty freightCalculationDocument for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightCalculationDocument" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid "freightCalculationDocument"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter an invalid freightCalculationDocument for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightCalculationDocument" equal "P" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "O valor do docto frete deve ser V(Volume) ou N(Nota Fiscal)"

#-----------------------------------------------------------#
#    ---> Entering "N" value in "externalLabel"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter "N" value in freightCalculationDocument for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightCalculationDocument" equal "N" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "V" value in "freightCalculationDocument"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter "V" value in freightCalculationDocument for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightCalculationDocument" equal "V" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT VALIDATE FIELD "freightPayer/type" (String / Required) -
#  Should be:
#  "R" - Remetente
#  "D" - Destinatário
#  "C" - cfr. Contrato
#  "N" - Não se aplica
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "null" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "empty" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter a n invalid freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "X" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "O valor do tipo tomador deve ser R(Remetente), D(Destinatário), C(Cfr. Contrato) ou N(Não se aplica) / Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering "R" value in "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "R" value in freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "R" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering "D" value in "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "D" value in freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "D" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering "C" value in "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter "C" value in freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "C" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "N" value in "freightPayer/type"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "N" value in freightPayer/type for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "N" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"


###############################################################################
#  PUT: VALIDATE FIELD "freightPayer/type" (String / Required) -
#  Should be:
#  "R" - Remetente
#  "D" - Destinatário
#  "C" - cfr. Contrato
#  "N" - Não se aplica
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "null" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "empty" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering "X" value in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "X" value in deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "X" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "O valor do tipo tomador deve ser R(Remetente), D(Destinatário), C(Cfr. Contrato) ou N(Não se aplica) / Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering "R" value in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "R" value indeliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "R" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering "D" value in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "D" value indeliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "D" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering "C" value in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter "C" value indeliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "C" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "N" value in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "N" value indeliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "type" equal "N" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Só é permitido tomador para o tipo de tomador C(Cfr. Contrato)"


###############################################################################
#  POST: VALIDATE FIELD "freightPayer/cnpj" (Integer / Optional)
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "freightPayer/cnpj"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter a null freightPayer/cnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "cnpj" equal "null" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "É preciso informar um tomador para o tipo C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering a null "freightPayer/cnpj"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter an empty freightPayer/cnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "cnpj" equal "empty" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "É preciso informar um tomador para o tipo C(Cfr. Contrato)"

#-----------------------------------------------------------#
#    ---> Entering an invalid document "freightPayer/cnpj"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter an invalid freightPayer/cnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "cnpj" equal "integer" in the block "freightPayer"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "não encontrado"


###############################################################################
#  PUT: VALIDATE FIELD "deliveryType" (Integer / Required) -
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
  Scenario: PUT Status Code 400: Enter a null deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid (alphanumeric) "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "H" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid (numeric) "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "integer" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Não há registro do tipo de entrega:"

#-----------------------------------------------------------#
#    ---> Entering "1" in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "1" in deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "N1" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "2" in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "2" in deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "N2" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "3" in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "3" in deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "N3" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "5" in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "5" in deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "N5" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "9" in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "9" in deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "N9" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "10" in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "10" in deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "N10" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "11" in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "11" in deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "N11" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "12" in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "12" in deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "N12" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "20" in "deliveryType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter "20" in deliveryType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "deliveryType" equal "N20" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Não há registro do tipo de entrega: 20"


###############################################################################
#  PUT: VALIDATE FIELD "transportType" (Integer / Required) -
#  1 - Leve
#  2 - Pesado
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "transportType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "transportType" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "transportType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "transportType" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid "transportType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "transportType" equal "integer" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Tipo de transporte não cadastrado!"

#-----------------------------------------------------------#
#    ---> Entering "1" in "transportType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter "1" in transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "transportType" equal "N1" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "2" in "transportType"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter "1" in transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "transportType" equal "N2" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "isShipment" (Boolean / Required)
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "isShipment"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isShipment" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "isShipment"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isShipment" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering true value in "isShipment"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isShipment" equal "true" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering false value in "isShipment"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter false value in transportType for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isShipment" equal "false" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "exchangeGatheringOnDelivery" (String / Required)
#  Should be:
# "N" - Não faz Troca Casada
# "A" - Regiões Apontadas
# "T" - Todas as Regiões
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null exchangeGatheringOnDelivery for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an empty "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty exchangeGatheringOnDelivery for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-----------------------------------------------------------#
#    ---> Entering an invalid "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter a null exchangeGatheringOnDelivery for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "X" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "O valor da troca casada deve ser T(Todas as Regiões), A(Regiões Apontadas) ou N(Não faz troca casada)"

#-----------------------------------------------------------#
#    ---> Entering "N" value in "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 201: Enter "N" value in exchangeGatheringOnDelivery for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "N" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "A" value in "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 201: Enter "A" value in exchangeGatheringOnDelivery for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "A" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering "T" value in "exchangeGatheringOnDelivery"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 201: Enter "T" value in exchangeGatheringOnDelivery for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "exchangeGatheringOnDelivery" equal "T" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "sourceId" (String / Optional)
###############################################################################

#-----------------------------------------------------------#
#    ---> Entering a null "sourceId"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null sourceId for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sourceId" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering an empty "sourceId"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter an empty sourceId for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sourceId" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-----------------------------------------------------------#
#    ---> Entering an invalid "sourceId"
#-----------------------------------------------------------#
  Scenario: PUT Status Code 422: Enter an invalid sourceId for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sourceId" equal "ABC" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Erro ao validar fonte ORA-20000: Fonte n"


###############################################################################
#  PUT: VALIDATE FIELD "invoiceIssuerCnpj" (Integer / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "invoiceIssuerCnpj"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null invoiceIssuerCnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "invoiceIssuerCnpj" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#--------------------------------------------------------------#
#    ---> Entering an empty "invoiceIssuerCnpj"
#--------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter an empty invoiceIssuerCnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "invoiceIssuerCnpj" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering an invalid (alphanumeric) "invoiceIssuerCnpj"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid invoiceIssuerCnpj for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "invoiceIssuerCnpj" equal "string" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering a valid cnpj in "invoiceIssuerCnpj"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 201: Enter a valid cnpj in for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "invoiceIssuerCnpj" equal "faker" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "isOrs" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "isOrs"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null isOrs for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isOrs" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering an empty "isOrs"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter an empty isOrs for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isOrs" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering true value in "isOrs"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in isOrs for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isOrs" equal "true" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering false value in "isOrs"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in isOrs for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isOrs" equal "false" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "worksOn/saturdays" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "worksOn/saturdays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null worksOn/saturdays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "saturdays" equal "null" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering an empty "worksOn/saturdays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter an empty worksOn/saturdays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "saturdays" equal "empty" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering true value in "worksOn/saturdays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in worksOn/saturdays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "saturdays" equal "true" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering false value in "worksOn/saturdays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in worksOn/saturdays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "saturdays" equal "false" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "worksOn/sundays" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "worksOn/sundays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null worksOn/sundays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sundays" equal "null" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering an empty "worksOn/sundays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter an empty worksOn/sundays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sundays" equal "empty" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering true value in "worksOn/sundays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in worksOn/sundays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sundays" equal "true" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering false value in "worksOn/sundays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter false value in worksOn/sundays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "sundays" equal "false" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "worksOn/holidays" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "worksOn/holidays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null worksOn/holidays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "holidays" equal "null" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering an empty "worksOn/holidays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter an empty worksOn/holidays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "holidays" equal "empty" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering true value in "worksOn/holidays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in worksOn/holidays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "holidays" equal "true" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering false value in "worksOn/holidays"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter false value in worksOn/holidays for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "holidays" equal "false" in the block "worksOn"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "isInternationalFreightForwarder" (Boolean / Optional)
###############################################################################

#------------------------------------------------------------------#
#    ---> Entering a null "isInternationalFreightForwarder"
#------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null isInternationalFreightForwarder for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isInternationalFreightForwarder" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#------------------------------------------------------------------#
#    ---> Entering an empty "isInternationalFreightForwarder"
#------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter an empty isInternationalFreightForwarder for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isInternationalFreightForwarder" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#------------------------------------------------------------------#
#    ---> Entering true value in "isInternationalFreightForwarder"
#------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in isInternationalFreightForwarder for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isInternationalFreightForwarder" equal "true" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-------------------------------------------------------------------#
#    ---> Entering false value in "isInternationalFreightForwarder"
#-------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter false value in isInternationalFreightForwarder for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "isInternationalFreightForwarder" equal "false" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


#################################################################################
#  PUT: VALIDATE FIELD "requestsIdentificationOfRecipient" (Boolean / Optional)
#################################################################################

#-------------------------------------------------------------------#
#    ---> Entering a null "requestsIdentificationOfRecipient"
#-------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null requestsIdentificationOfRecipient for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "requestsIdentificationOfRecipient" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-------------------------------------------------------------------#
#    ---> Entering an empty "requestsIdentificationOfRecipient"
#-------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null requestsIdentificationOfRecipient for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "requestsIdentificationOfRecipient" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-------------------------------------------------------------------#
#    ---> Entering true value in "requestsIdentificationOfRecipient"
#-------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in requestsIdentificationOfRecipient for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "requestsIdentificationOfRecipient" equal "true" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#--------------------------------------------------------------------#
#    ---> Entering false value in "requestsIdentificationOfRecipient"
#--------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter false value in requestsIdentificationOfRecipient for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "requestsIdentificationOfRecipient" equal "false" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "issuesIncomingInvoiceOnGathering" (Boolean / Optional)
###############################################################################

#------------------------------------------------------------------#
#    ---> Entering a null "issuesIncomingInvoiceOnGathering"
#------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null issuesIncomingInvoiceOnGathering for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "issuesIncomingInvoiceOnGathering" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#------------------------------------------------------------------#
#    ---> Entering an empty "issuesIncomingInvoiceOnGathering"
#------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null issuesIncomingInvoiceOnGathering for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "issuesIncomingInvoiceOnGathering" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-------------------------------------------------------------------#
#    ---> Entering true value in "issuesIncomingInvoiceOnGathering"
#-------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in issuesIncomingInvoiceOnGathering for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "issuesIncomingInvoiceOnGathering" equal "true" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#--------------------------------------------------------------------#
#    ---> Entering false value in "issuesIncomingInvoiceOnGathering"
#--------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter false value in issuesIncomingInvoiceOnGathering for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "issuesIncomingInvoiceOnGathering" equal "false" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "displaysDeliveriesOnControlPanel" (Boolean / Optional)
###############################################################################

#------------------------------------------------------------------#
#    ---> Entering a null "displaysDeliveriesOnControlPanel"
#------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null displaysDeliveriesOnControlPanel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "displaysDeliveriesOnControlPanel" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#------------------------------------------------------------------#
#    ---> Entering an empty displaysDeliveriesOnControlPanel"
#------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null displaysDeliveriesOnControlPanel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "displaysDeliveriesOnControlPanel" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-------------------------------------------------------------------#
#    ---> Entering true value in displaysDeliveriesOnControlPanel"
#-------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in displaysDeliveriesOnControlPanel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "displaysDeliveriesOnControlPanel" equal "true" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#-------------------------------------------------------------------#
#    ---> Entering false value in displaysDeliveriesOnControlPanel"
#-------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in displaysDeliveriesOnControlPanel for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "displaysDeliveriesOnControlPanel" equal "false" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "standardDeadlineForOccurrences" (Integer / Optional)
###############################################################################

#------------------------------------------------------------------#
#    ---> Entering a null "standardDeadlineForOccurrences"
#------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null standardDeadlineForOccurrences for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "standardDeadlineForOccurrences" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#------------------------------------------------------------------#
#    ---> Entering an empty "standardDeadlineForOccurrences"
#------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter an empty standardDeadlineForOccurrences for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "standardDeadlineForOccurrences" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#------------------------------------------------------------------#
#    ---> Entering an invalid "standardDeadlineForOccurrences"
#------------------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid standardDeadlineForOccurrences for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "standardDeadlineForOccurrences" equal "X" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#-------------------------------------------------------------------#
#    ---> Entering a numeric value "standardDeadlineForOccurrences"
#-------------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a valid standardDeadlineForOccurrences for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "standardDeadlineForOccurrences" equal "integer" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "freightValuesWithoutIcms" (Boolean / Optional)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "freightValuesWithoutIcms"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null freightValuesWithoutIcms for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightValuesWithoutIcms" equal "null" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering an empty "freightValuesWithoutIcms"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null freightValuesWithoutIcms for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightValuesWithoutIcms" equal "empty" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering true value in "freightValuesWithoutIcms"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter true value in freightValuesWithoutIcms for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightValuesWithoutIcms" equal "true" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering false value in "freightValuesWithoutIcms"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter false value in freightValuesWithoutIcms for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "freightValuesWithoutIcms" equal "false" in the block "root"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "trackingUpdate/user" (Boolean / Required)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/user"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null trackingUpdate/user for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "user" equal "null" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/user"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty trackingUpdate/user for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "user" equal "empty" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering a valid "trackingUpdate/user"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter a null trackingUpdate/user for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "user" equal "string" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data


###############################################################################
#  PUT: VALIDATE FIELD "trackingUpdate/dateTime" (Boolean / Required)
###############################################################################

#---------------------------------------------------------------#
#    ---> Entering a null "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter a null trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "null" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering an empty "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an empty trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "empty" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering a valid "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 200: Enter an empty trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "2012-06-29T00:00:00.000Z" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Carriers-body-put should contain valid data

#---------------------------------------------------------------#
#    ---> Entering an invalid "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "2012/06/29T00:00:00.000Z" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

#---------------------------------------------------------------#
#    ---> Entering an invalid format in "trackingUpdate/dateTime"
#---------------------------------------------------------------#
  Scenario: PUT Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "04-08-2016T00:00:00.000Z" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "29-02-2016T00:00:00.000Z" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "30-02-2016T00:00:00.000Z" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

  Scenario: PUT Status Code 400: Enter an invalid format in trackingUpdate/dateTime for path "/aldebaran-carriers/carriers/<cnpj>/contracts"
    When  Entering in carrier-contracts body the field "dateTime" equal "33-03-2016T00:00:00.000Z" in the block "trackingUpdate"
    When  PUT in carriers-contracts-update passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"


###############################################################################
# PUT: /aldebaran-carriers/carriers/{cnpj}/contracts
#    ---> Invalid authentication
###############################################################################

#-------------------------------------------------------------------------------------#
#    ---> Entering an Invalid Username
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    When  PUT in carriers-contracts-update passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering an Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    When  PUT in carriers-contracts-update passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering an Invalid Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    When  PUT in carriers-contracts-update passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

#-------------------------------------------------------------------------------------#
#    ---> Entering an Empty Password
#-------------------------------------------------------------------------------------#
  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    When  PUT in carriers-contracts-update passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"
