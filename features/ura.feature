@ura @ready
Feature: Endpoint Aldebaran URA
  Service used to retrieve customer order information. It receives as the input parameter OR the order number OR the customer's CPF.
  when no parameter is received, or both are received simultaneously, this service should return an error message.
  Otherwise, it calls a procedure in the SIGE database that is responsible for generating a file in the XML format containing the client request information.

#------------------------------------------------------------------------------
# SUCCESSFUL SCENARIOS
#------------------------------------------------------------------------------
  @list_order_cpf
  Scenario: POST Compare response Lockdown And response Aldebaran for URA Order
    When I fetch an order information from Aldebaran
    Then I will receive the return message successfull
    Then I will Valid the response
  @list_order_cpf
  Scenario: POST Compare response Lockdown And response Aldebaran for URA CPF
    When I fetch an client CPF information from Aldebaran
    Then I will receive the return message successfull
    Then I will Valid the response by cpf

  Scenario: POST valide response Aldebaran for URA Obter Itens Atualizados
    When I fetch an ObterItensAtualizados information from Aldebaran
    Then I will receive the return message successfull
    Then I will Valid the response body itens atualizados

#------------------------------------------------------------------------------
# ERROR SCENARIOS
#------------------------------------------------------------------------------

  Scenario: POST Compare response Lockdown And response Aldebaran for URA Order invalid
    When I fetch an order invalid information from Aldebaran
    Then I will receive the return message successfull
    Then I will valid the invalid call response

  Scenario: POST Compare response Lockdown And response Aldebaran for URA CPF invalid
    When I fetch an client CPF invalid information from Aldebaran
    Then I will receive the return message successfull
    Then I will valid the invalid call response
