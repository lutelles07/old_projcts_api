@habbit_helper
Feature: Consume and validate queue in RabbitMQ

  Scenario: consult messag rabbitmq for "directselling"
    Given I acecss the rabbitmq the "aldebaran-directselling" in get message fo queue "directselling.test.12.queue"
    Then I check response with json_schema "json_directselling.json"

  Scenario: consult messag rabbitmq for aldebaran inventoryoutput
    Given I acecss the rabbitmq the "aldebaran-inventoryoutput" in get message fo queue "inventoryoutput.test.queue"
    Then I check response with json_schema "json_inventoryoutput.json"
@direct
  Scenario: consult messag rabbitmq for aldebaran inventorychange
    Given I acecss the rabbitmq the "aldebaran-inventorychange" in get message fo queue "inventorychange.test.queue"
    Then I check response with json_schema "json_inventorychange.json"
