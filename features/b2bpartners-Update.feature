@ready @b2bpartnersUpdate @all_b2bpartners
Feature: Endpoint Aldebaran B2BPartners Update

#**************************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @b2bpartnersUpdate --format html --out reports/b2bpartners-Update.html
#**************************************************************************************************************************

  Background:
    Given GET B2BPartners Id from database
    When  GET in B2BPartners by id passing a "valid" authentication
    Then  Response code should be equal "200"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "agenciaBanco"
###############################################################################
  Scenario: PUT Validate response when updating agenciaBanco field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "agenciaBanco" equal "5052" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "bairroFat"
###############################################################################
  Scenario: PUT Validate response when updating bairroFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "bairroFat" equal "Vila Matilde" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "banco"
###############################################################################

  Scenario: PUT Validate response when updating banco field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "banco" equal "341" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "contaBanco"
###############################################################################

  Scenario: PUT Validate response when updating contaBanco field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "contaBanco" equal "50443" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "dgAgenciaBanco"
###############################################################################

  Scenario: PUT Validate response when updating dgAgenciaBanco field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "dgAgenciaBanco" equal "4" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "dgCtaBanco"
###############################################################################

  Scenario: PUT Validate response when updating dgCtaBanco field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "dgCtaBanco" equal "9" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "dtNasc"
###############################################################################

  Scenario: PUT Validate response when updating dtNasc field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "dtNasc" equal "1972-01-12" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "emailFat"
###############################################################################

  Scenario: PUT Validate response when updating emailFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "emailFat" equal "fake" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "idCia"
###############################################################################

  Scenario: PUT Validate response when updating idCia field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idCia" equal "1" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "idClasfCliente"
###############################################################################

  Scenario: PUT Validate response when updating idClasfCliente field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idClasfCliente" equal "1" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "idClienteFat" (CNPJ)
###############################################################################

  Scenario: PUT Validate response when updating idClienteFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idClienteFat" equal "fakeCNPJ" passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Resource not found"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "idClienteFat" (CPF)
###############################################################################

  Scenario: PUT Validate response when updating idClienteFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idClienteFat" equal "fakeCPF" passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Resource not found"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "idTipclieFat"
#   The system overwrites this value with '1' or '2'
###############################################################################

  Scenario: PUT Validate response when updating idTipclieFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idTipclieFat" equal "3" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "idUnineg"
#   The system overwrites this value with '2'
###############################################################################

  Scenario: PUT Validate response when updating idTipclieFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idUnineg" equal "1" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "insestFat"
#   The system overwrites this value with database value
###############################################################################

  Scenario: PUT Validate response when updating idTipclieFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "insestFat" equal "123456789" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "logradouroFat"
###############################################################################

  Scenario: PUT Validate response when updating logradouroFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "logradouroFat" equal "Rua dos Apiacas" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "nmFavorecido"
###############################################################################

  Scenario: PUT Validate response when updating nmFavorecido field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "nmFavorecido" equal "empresa 01" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "nomeFat"
###############################################################################

  Scenario: PUT Validate response when updating nomeFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "nomeFat" equal "Tec. and Solutions" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database


###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "numeroFat"
###############################################################################

  Scenario: PUT Validate response when updating numeroFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "numeroFat" equal "480" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "referenciaFat"
###############################################################################

  Scenario: PUT Validate response when updating referenciaFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "referenciaFat" equal "ABC" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "tel1Fat"
###############################################################################

  Scenario: PUT Validate response when updating tel1Fat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "tel1Fat" equal "00009801" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "tel2Fat"
###############################################################################

  Scenario: PUT Validate response when updating tel2Fat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "tel2Fat" equal "00009802" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "tel2Fat"
###############################################################################

  Scenario: PUT Validate response when updating tel2Fat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "telFatIn" equal "00009803" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "tpConta"
###############################################################################

  Scenario: PUT Validate response when updating tpConta field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "tpConta" equal "P" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "cepFatIn" / "cidadeFat" / "ufFat" (Address data)
###############################################################################

  Scenario: PUT Validate response when updating address data field for path "/aldebaran-b2bpartners/b2bpartners"
    Given that input the data:
      | cepFatIn   | cidadeFat        |  ufFat |
      | 30140081   | BELO HORIZONTE   |   MG   |
    When  PUT in B2BPartners with "addressData" equal "validAddress" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#   PUT: Negative Scenarios
#------------------------------------------------------------------------------
#	Status Code
#   200	Sucesso; response body contendo Json de representação do recurso
#   400	Algum parâmetro com tipo inválido
#   401	Cliente não autenticado
#   404	Recurso não encontrado
#   405	Operação não suportada; Serviço suporta apenas GET
#   500	Erro interno (SIGE inacessível, etc.)
###############################################################################

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "agenciaBanco"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty agenciaBanco field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "agenciaBanco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "bairroFat"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty bairroFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "bairroFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "banco"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty bairroFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "banco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "contaBanco"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty contaBanco field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "contaBanco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "dgAgenciaBanco"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty dgAgenciaBanco field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "dgAgenciaBanco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "dgCtaBanco"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty dgCtaBanco field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "dgCtaBanco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid format "dtNasc"
###############################################################################

  # Scenario: PUT Status Code 422: Entering an invalid format for dtNasc field for path "/aldebaran-b2bpartners/b2bpartners"
  #   When  PUT in B2BPartners with "dtNasc" equal "04-03-2000" passing a "valid" authentication
  #   Then  Response code should be equal "422"
  #   And   Verify if the response contains the field X-tid
  #   Then  I should see the message "dtNasc invalid format for date :expected format YYYY-MM-dd"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid format "dtNasc"
###############################################################################

  Scenario: PUT Status Code 400: Entering an invalid dtNasc field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "dtNasc" equal "1980-6a-9a" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "dtNasc invalid format for date :expected format YYYY-MM-dd"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "emailFat"
###############################################################################

  Scenario: PUT Validate response when updating emailFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "emailFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "idCia"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty idCia field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idCia" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "idClasfCliente"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty idClasfCliente field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idClasfCliente" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "idClasfCliente"
###############################################################################

  Scenario: PUT Status Code 422: Entering an empty idClasfCliente field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idClasfCliente" equal "3" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "ID_CLASF_CLIENTE deve ser 0 - Normal, 1 - VIP ou 2 - Critico"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "idClienteFat"
###############################################################################

Scenario: PUT Status Code 404: Entering an invalid idClienteFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idClienteFat" equal "12345" passing a "valid" authentication
    Then  Response code should be equal "404"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Resource not found"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "idTipclieFat"
###############################################################################

Scenario: PUT Status Code 400: Entering an empty idTipclieFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idTipclieFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "idUnineg"
###############################################################################

Scenario: PUT Status Code 400: Entering an empty idUnineg field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "idUnineg" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "logradouroFat"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty logradouroFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "logradouroFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "nmFavorecido"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty nmFavorecido field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "nmFavorecido" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "nomeFat"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty nomeFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "nomeFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a null value "numeroFat" (Optional)
###############################################################################

  Scenario: PUT Status Code 200: Entering an empty numeroFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "numeroFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "referenciaFat" (Optional)
###############################################################################

  Scenario: PUT Status Code 200: Entering an empty referenciaFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "referenciaFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "tel1Fat" (Optional)
###############################################################################

  Scenario: PUT Status Code 200: Entering an empty tel1Fat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "tel1Fat" equal "" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "tel2Fat" (Optional)
###############################################################################

  Scenario: PUT Status Code 200: Entering an empty tel2Fat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "tel2Fat" equal "" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering a valid "telFatIn" (Required)
###############################################################################

  Scenario: PUT Status Code 200: Entering an empty telFatIn field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "telFatIn" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "tpConta"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty nomeFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "tpConta" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "ufFat"
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty ufFat field for path "/aldebaran-b2bpartners/b2bpartners"
    When  PUT in B2BPartners with "ufFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "cepFatIn" (Address data)
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty cepFatIn field for path "/aldebaran-b2bpartners/b2bpartners"
    Given that input the data:
      | cepFatIn   | cidadeFat        |  ufFat |
      |            | BELO HORIZONTE   |   MG   |
    When  PUT in B2BPartners with "addressData" equal "validAddress" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "cidadeFat" (Address data)
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty cidadeFat field for path "/aldebaran-b2bpartners/b2bpartners"
    Given that input the data:
      | cepFatIn   | cidadeFat   |  ufFat |
      | 30140081   |             |   MG   |
    When  PUT in B2BPartners with "addressData" equal "validAddress" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "ufFat" (Address data)
###############################################################################

  Scenario: PUT Status Code 400: Entering an empty ufFat field for path "/aldebaran-b2bpartners/b2bpartners"
    Given that input the data:
      | cepFatIn   | cidadeFat        |  ufFat |
      | 30140081   | BELO HORIZONTE   |        |
    When  PUT in B2BPartners with "addressData" equal "validAddress" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad Request"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Invalid authentication (Invalid Username)
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    When  PUT in B2BPartners with "logradouroFat" equal "Rua dos Jupias" passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Invalid authentication (Empty Username)
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    When  PUT in B2BPartners with "logradouroFat" equal "Rua dos Jupias" passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Invalid authentication (Invalid Password)
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    When  PUT in B2BPartners with "logradouroFat" equal "Rua dos Jupias" passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

###############################################################################
#  PUT: /aldebaran-b2bpartners/b2bpartners
#    ---> Invalid authentication (Empty Password)
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    When  PUT in B2BPartners with "logradouroFat" equal "Rua dos Jupias" passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"
