@sige_files @ready
Feature: Endpoint Aldebaran Sige-Files

###############################################################################
#   GET: Aldebaran-Sige-Files /aldebaran-sige-files/file/<file_id>
#   NFS PATH in QA:  [root@napsao-qa-nix-aldebaran-3 msaf]# cd /net/wm/msaf
###############################################################################

  Scenario: Aldebaran Sige Files: Write and Read File from NFS
   # Write process
    Given Sige Database: Prepare database to create file in NFS with 10 lines
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Success"
   # Read process
    Given Sige Database: Prepare database to read file from NFS
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Sige Database: Verify that file content was created
   #After test
    Then Sige Database: Delete files for id

  Scenario: Aldebaran Sige Files Write and Read File from NFS
    Given Sige Database: Prepare database to create file in NFS with 10 lines
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Success"
    Given Sige Database: Prepare database to read file from NFS
    Then  I verify if the polling updated status for "S"
    Then Sige Database: Delete files for id

  Scenario: Aldebaran Sige Files: Read file already existent in database
    # Write process
    Given Sige Database: Prepare database to create file in NFS with 10 lines
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Success"
    # Read process
    Given Sige Database: Prepare database to read file from NFS
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   Sige Database: Verify that file content was created
    # Read process duplicated
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "valid" authentication
    Then  Response code should be equal "422"
    Then  I should see the message "File already read"
      #After test
    Then Sige Database: Delete files for id

###############################################################################
#   GET: Negative Scenarios
#------------------------------------------------------------------------------
#	Status Code
#   200	Sucesso; response body contendo Json de representação do recurso
#   400	Algum parâmetro com tipo inválido
#   401	Cliente não autenticado
#   404	Recurso não encontrado
#   405	Operação não suportada; Serviço suporta apenas GET
#   500	Erro interno (SIGE inacessível, etc.)
###############################################################################

  Scenario: POST Status Code 401: Bad Credentials: invalid username
    Given Sige Database: Prepare database to create file in NFS with 10 lines
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "invalid_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"
    Then Sige Database: Delete files for id

  Scenario: POST Status Code 401: Bad Credentials: empty username
    Given Sige Database: Prepare database to create file in NFS with 10 lines
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "empty_username" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"
    Then Sige Database: Delete files for id

  Scenario: POST Status Code 401: Bad Credentials: invalid password
    Given Sige Database: Prepare database to create file in NFS with 10 lines
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "invalid_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"
    Then Sige Database: Delete files for id

  Scenario: POST Status Code 401: Bad Credentials: empty password
    Given Sige Database: Prepare database to create file in NFS with 10 lines
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "empty_password" authentication
    Then  Response code should be equal "401"
    And   Verify if the response contains the field X-tid
    Then  I should see the message "Bad credentials"
    Then Sige Database: Delete files for id

  Scenario: POST Status Code 422: File or Directory Not Found
	  Given Sige Database: Prepare database to create file in NFS with 10 lines
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "valid" authentication
	  Then  Response code should be equal "200"
	# Read process
	  Given Sige Database: Prepare database to read file from NFS
	  Given Sige Database: Update field "SATC_CAMINHO" to value "inexistent.txt"
    When  POST in Aldebaran-SigeFiles with the last Sige File ID passing a "valid" authentication
    Then  Response code should be equal "422"
    Then  I should see the message "No such file or directory"
    And  Verify if the response contains the field X-tid
	  Then Sige Database: Delete files for id
