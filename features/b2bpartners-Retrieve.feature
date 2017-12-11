@ready @all_b2bpartners @b2bpartnersRetrieve
Feature: Endpoint Aldebaran B2BPartners Retrieve

#**************************************************************************************************************************
# Generating Reports HMTL: cucumber -p <env> -t @b2bpartnersRetrieve --format html --out reports/b2bpartners-Retrieve.html
#**************************************************************************************************************************

###############################################################################
#  GET: /aldebaran-b2bpartners/b2bpartners/{id} - GET
###############################################################################
  @run_10_times
  Scenario: GET B2BPartners for path '/aldebaran-b2bpartners/b2bpartners/<id>'
    Given GET B2BPartners Id from database
    When  GET in B2BPartners by id passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
    And   compare b2bpartners-retrieve with database


###############################################################################
#  GET: /aldebaran-b2bpartners/b2bpartners/cnpj - GET
###############################################################################

  Scenario: GET B2BPartners for path '/aldebaran-b2bpartners/b2bpartners/cnpj'
    Given GET B2BPartners Id from database
    When  GET in B2BPartners to list all cnpj passing a "valid" authentication
    Then  Response code should be equal "200"
    And   Verify if the response contains the field X-tid
