@cte @debug
Feature: CTE Knowledge of electronic transport API

  Scenario: Get Knowledge of electronic transport in cte cfop API
    Given I consult a cfop in cte API with cfop the "SP" for "SP" transfer "S"
    When Response code should be equal "200"
    Then I should see the response body_cfop

  Scenario: Get Knowledge of electronic transport in cte cfop API
    Given I consult a cfop in cte API with cfop the "SP" for "SP" transfer "N"
    When Response code should be equal "200"
    Then I should see the response body_cfop

  Scenario: Get Knowledge of electronic transport in cte cfop API
    Given I consult a cfop in cte API with cfop the "SP" for "MG" transfer "S"
    When Response code should be equal "200"
    Then I should see the response body_cfop

  Scenario: Get Knowledge of electronic transport in cte cfop API
    Given I consult a cfop in cte API with cfop the "SP" for "MG" transfer "N"
    When Response code should be equal "200"
    Then I should see the response body_cfop

  Scenario: Get Knowledge of electronic transport in cte taxes API
    Given I consult a taxes in cte API with price
    When Response code should be equal "200"
    Then the response body must contain the values of taxes and aliquot

###############################################################################
#   GET: Negative Scenarios
#	Status Code
#   400	Algum parâmetro com tipo inválido
#   401	Cliente não autenticado
#   404	Recurso não encontrado
###############################################################################

  Scenario: Get Knowledge of electronic transport in cte cfop API with uf_origen null
    Given I consult a cfop in cte API with cfop the "" for "SP" transfer "S"
    When Response code should be equal "404"
    Then I should see the response error "Not Found"

  Scenario: Get Knowledge of electronic transport in cte cfop API with uf_origen AA
    Given I consult a cfop in cte API with cfop the "AA" for "SP" transfer "S"
    When Response code should be equal "500"
    Then I should see the response error "Internal Server Error"

  Scenario: Get Knowledge of electronic transport in cte cfop API with uf_destino null
    Given I consult a cfop in cte API with cfop the "SP" for "" transfer "S"
    When Response code should be equal "404"
    Then I should see the response error "Not Found"

  Scenario: Get Knowledge of electronic transport in cte cfop API with uf_destino AA
    Given I consult a cfop in cte API with cfop the "SP" for "AA" transfer "S"
    When Response code should be equal "500"
    Then I should see the response error "Internal Server Error"

  Scenario: Get Knowledge of electronic transport in cte cfop API with transfer null
    Given I consult a cfop in cte API with cfop the "SP" for "SP" transfer ""
    When Response code should be equal "404"
    Then I should see the response error "Not Found"

  Scenario: Get Knowledge of electronic transport in cte taxes API price invalid
    Given I consult a taxes in cte API with price invalid
    When Response code should be equal "400"
    Then I should see the response error "Bad Request"

  Scenario: Get Knowledge of electronic transport in cte taxes API user invalid
    Given I consult a taxes in cte API with price user invalid
    When Response code should be equal "401"
    Then I should see the response error "Unable to authenticate using the Authorization header"

  Scenario: Get Knowledge of electronic transport in cte taxes API parameter invalid
    Given I consult a taxes in cte API with price parameter invalid
    When Response code should be equal "404"
    Then I should see the response error "Not Found"
