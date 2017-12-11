@ready @all_b2bpartners @b2bpartnersCreation
Feature: Endpoint Aldebaran B2BPartners Creation

#**************************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @b2bpartnersCreation --format html --out reports/b2bpartners-Creation.html
#**************************************************************************************************************************

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
###############################################################################

  Scenario: POST Status Code 200: Success - Creating a new resource for path "/aldebaran-b2bpartners/b2bpartners"
    When  POST in B2BPartners passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    When  GET in B2BPartners by id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Duplicate client
###############################################################################

  Scenario: POST Status Code 422: Validate aldebaran body duplicate responses for path "/aldebaran-b2bpartners/b2bpartners"
    Given GET B2BPartners Id from database
    When  GET in B2BPartners by id passing a "valid" authentication
    When  POST in B2BPartners duplicate client passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "idClienteFat already exists in the base"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "agenciaBanco"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty agenciaBanco
    When  POST in B2BPartners with "agenciaBanco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "bairroFat"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty bairroFat
    When  POST in B2BPartners with "bairroFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "banco"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty banco
    When  POST in B2BPartners with "banco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "cepFatIn"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty cepFatIn
    When  POST in B2BPartners with "cepFatIn" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "cidadeFat"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty cidadeFat
    When  POST in B2BPartners with "cidadeFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "contaBanco"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty contaBanco
    When  POST in B2BPartners with "contaBanco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "dgAgenciaBanco"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty dgAgenciaBanco
    When  POST in B2BPartners with "dgAgenciaBanco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "dgCtaBanco"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty dgCtaBanco
    When  POST in B2BPartners with "dgCtaBanco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "dgCtaBanco"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty dgCtaBanco
    When  POST in B2BPartners with "dgCtaBanco" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "dtNasc"
###############################################################################

  Scenario: POST Status Code 200: Enter an empty dtNasc
    When  POST in B2BPartners with "dtNasc" equal "" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "emailFat"
###############################################################################

  Scenario: POST Status Code 200: Enter an empty emailFat
    When  POST in B2BPartners with "emailFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "idCia"  (Should be '1')
###############################################################################

  Scenario: POST Status Code 422: Enter an invalid idCia
    When  POST in B2BPartners with "idCia" equal "2" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "FK nao encontrada (ID_CIA)"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "idCia"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty idCia
    When  POST in B2BPartners with "idCia" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "idClasfCliente"
###############################################################################

  Scenario: POST Status Code 422: Enter an invalid idClasfCliente
    When  POST in B2BPartners with "idClasfCliente" equal "6" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "ID_CLASF_CLIENTE deve ser 0 - Normal, 1 - VIP ou 2 - Critico"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "idClasfCliente"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty idClasfCliente
    When  POST in B2BPartners with "idClasfCliente" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "idClienteFat"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty idClienteFat
    When  POST in B2BPartners with idClienteFat equal "" with idTipclieFat equal "1" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "idClienteFat" - idTipclieFat = '1' (CNPJ)
###############################################################################

  Scenario: POST Status Code 400: Enter an empty idClienteFat (CNPJ)
    When  POST in B2BPartners with idClienteFat equal "1234578901" with idTipclieFat equal "1" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "CGC incorreto"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "idClienteFat" - idTipclieFat = '2' (CPF)
###############################################################################

  Scenario: POST Status Code 422: Enter an invalid idClienteFat (CPF)
    When  POST in B2BPartners with idClienteFat equal "1234578901" with idTipclieFat equal "2" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "CPF incorreto"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "idTipclieFat"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty idTipclieFat
    When  POST in B2BPartners with "idTipclieFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "idUnineg"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty idClasfCliente
    When  POST in B2BPartners with "idUnineg" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "insestFat"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty insestFat
    When  POST in B2BPartners with "insestFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "logradouroFat"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty logradouroFat
    When  POST in B2BPartners with "logradouroFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "nmFavorecido"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty nmFavorecido
    When  POST in B2BPartners with "nmFavorecido" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "nomeFat"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty nomeFat
    When  POST in B2BPartners with "nomeFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "paisFat"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty paisFat
    When  POST in B2BPartners with "paisFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "paisFat"
###############################################################################
  Scenario: POST Status Code 422: Enter an invalid paisFat
    When  POST in B2BPartners with "paisFat" equal "Colombia" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    Then  I should see the message "P_PAIS_FAT, deve ser um país já cadastrado"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "sexo"
###############################################################################

  Scenario: POST Status Code 200: Enter an empty sexo
    When  POST in B2BPartners with "sexo" equal "" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "sexo"
###############################################################################

  Scenario: POST Status Code 200: Enter an empty sexo
    When  POST in B2BPartners with "sexo" equal "K" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "tel1Fat"
###############################################################################

  Scenario: POST Status Code 200: Enter an empty tel1Fat
    When  POST in B2BPartners with "tel1Fat" equal "" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "tel2Fat"
###############################################################################

  Scenario: POST Status Code 200: Enter an empty tel2Fat
    When  POST in B2BPartners with "tel2Fat" equal "" passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "telFatIn"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty telFatIn
    When  POST in B2BPartners with "telFatIn" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an empty "tpConta"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty tpConta
    When  POST in B2BPartners with "tpConta" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "tpConta"
###############################################################################

  Scenario: POST Status Code 422: Enter an invalid tpConta
    When  POST in B2BPartners with "tpConta" equal "B" passing a "valid" authentication
    Then  Response code should be equal "422"
    And   Verify if the response contains the field X-tid
#    Then  I should see the message "TP_CONTA deve ser P - Poupança ou C - Corrente"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Entering an invalid "ufFat"
###############################################################################

  Scenario: POST Status Code 400: Enter an empty ufFat
    When  POST in B2BPartners with "ufFat" equal "" passing a "valid" authentication
    Then  Response code should be equal "400"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad Request"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Invalid authentication (Invalid Username)
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: invalid username
    When  POST in B2BPartners passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Invalid authentication (Empty Username)
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: empty username
    When  POST in B2BPartners passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Invalid authentication (Invalid Password)
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: invalid password
    When  POST in B2BPartners passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"

###############################################################################
#  POST: /aldebaran-b2bpartners/b2bpartners
#    ---> Invalid authentication (Empty Password)
###############################################################################

  Scenario: GET Status Code 401: Cliente não autenticado: empty password
    When  POST in B2BPartners passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    And  I should see the message "Bad credentials"
