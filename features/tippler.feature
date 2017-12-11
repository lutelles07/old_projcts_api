@tippler @ready
Feature: Endpoint Aldebaran Tippler
@debug
	Scenario: GET Aldebaran-Tippler valid download type edis REV
		#Given GET Aldebaran-Tippler Billing Types from database
		When  GET in Aldebaran-Tippler in new Aldebaran Server type REV
		Then  Response code should be equal "200"
		And I Valid if the response contains the field X-tid
		Then  Valid Aldebaran-Tippler Response body equal "Teste download REV"
@debug
	Scenario: GET Aldebaran-Tippler valid download type invoices REV
		#Given GET Aldebaran-Tippler Billing Types from database
		When  GET in Aldebaran-Tippler in new Aldebaran Server type invoices REV
		Then  Response code should be equal "200"
		And I Valid if the response contains the field X-tid
		Then  Valid Aldebaran-Tippler Response body equal "Teste download REV"
@debug
	Scenario: GET Aldebaran-Tippler valid download type edis REM
		#Given GET Aldebaran-Tippler Billing Types from database
		When  GET in Aldebaran-Tippler in new Aldebaran Server type REM
		Then  Response code should be equal "200"
		And I Valid if the response contains the field X-tid
		Then  Valid Aldebaran-Tippler Response body equal "Teste download REM"
@debug
	Scenario: GET Aldebaran-Tippler valid download type invoices REM
		#Given GET Aldebaran-Tippler Billing Types from database
		When  GET in Aldebaran-Tippler in new Aldebaran Server type invoices REM
		Then  Response code should be equal "200"
		And I Valid if the response contains the field X-tid
		Then  Valid Aldebaran-Tippler Response body equal "Teste download REM"
@debug
	Scenario: GET Aldebaran-Tippler valid download type CHK
		#Given GET Aldebaran-Tippler Billing Types from database
		When  GET in Aldebaran-Tippler in new Aldebaran Server type CHK
		Then  Response code should be equal "200"
		And I Valid if the response contains the field X-tid
		Then  Valid Aldebaran-Tippler Response body equal "TESTE DOWNLOAD CHK"
@debug
	Scenario: GET Aldebaran-Tippler valid download alternative type CHK
		#Given GET Aldebaran-Tippler Billing Types from database
		When  GET in Aldebaran-Tippler in new Aldebaran Server type CHK download alternative
		Then  Response code should be equal "200"
		And I Valid if the response contains the field X-tid
		Then  Valid Aldebaran-Tippler Response body equal "TESTE DOWNLOAD CHK"
@debug
	Scenario: GET Aldebaran-Tippler valid download alternative type REM
		#Given GET Aldebaran-Tippler Billing Types from database
		When  GET in Aldebaran-Tippler in new Aldebaran Server type REM download alternative
		Then  Response code should be equal "200"
		And I Valid if the response contains the field X-tid
		Then  Valid Aldebaran-Tippler Response body equal "TESTE DOWNLOAD REM"
@debug
	Scenario: GET Aldebaran-Tippler valid download alternative type invoices REM
		#Given GET Aldebaran-Tippler Billing Types from database
		When  GET in Aldebaran-Tippler in new Aldebaran Server type invoices REM download alternative
		Then  Response code should be equal "200"
		And I Valid if the response contains the field X-tid
		Then  Valid Aldebaran-Tippler Response body equal "TESTE DOWNLOAD REM"
@debug
	Scenario: GET Aldebaran-Tippler valid download alternative type invoices REV
		#Given GET Aldebaran-Tippler Billing Types from database
		When  GET in Aldebaran-Tippler in new Aldebaran Server type invoices REV download alternative
		Then  Response code should be equal "200"
		And I Valid if the response contains the field X-tid
		Then  Valid Aldebaran-Tippler Response body equal "TESTE DOWNLOAD REV"
@debug
	Scenario: GET Aldebaran-Tippler valid download alternative type REV
		#Given GET Aldebaran-Tippler Billing Types from database
		When  GET in Aldebaran-Tippler in new Aldebaran Server type REV download alternative
		Then  Response code should be equal "200"
		And I Valid if the response contains the field X-tid
		Then  Valid Aldebaran-Tippler Response body equal "TESTE DOWNLOAD REV"
@rabbitmq
	Scenario: Consult message tippler REM in RabbitMQ
		Given I acecss the rabbitmq to tippler "REM" for queue "tippler.qa.teste"
		Then I check response_tippler with json_schema "json_tippler_rem.json"
@rabbitmq
	Scenario: Consult message tippler REV in RabbitMQ
		Given I acecss the rabbitmq to tippler "REV" for queue "tippler.qa.teste"
		Then I check response_tippler with json_schema "json_tippler_rev.json"

################################################################################
                             #  NEGATIVE SCENARIOS  #
################################################################################
@debug
	Scenario: GET Aldebaran Tippler with invalid user
		When GET in Aldebaran Tipller with invalid user
		Then Response code should be equal "401"
		And I Valid if the response contains the field X-tid
		Then I see the error message "Bad credentials"
@debug
	Scenario: GET Aldebaran Tippler with ID invalid
	  Given Get in Aldebaran Tipller with id invalid
		Then Response code should be equal "400"
		And I Valid if the response contains the field X-tid
		Then I see the error message "Bad Request"
@debug
	Scenario: GET Aldebaran Tippler with ID not existent
	  Given Get in Aldebaran Tipller with not existent
		Then Response code should be equal "404"
		And I Valid if the response contains the field X-tid
		Then I see the error message "Resource not found"
