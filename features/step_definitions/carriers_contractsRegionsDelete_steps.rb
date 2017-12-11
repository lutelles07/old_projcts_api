When(/^DELETE in carriers\-contracts\-regions passing a "([^"]*)" authentication$/) do |authentication|
  carriersRegions= Aldebaran_carriers_contract_regions.new(authentication)

  @response = carriersRegions.delete(@cnpj_megaRoute.to_i, @branchID.to_i, @contractID.to_i,@regionID )

  Debug.new.debug(@response)
end


When(/^format the endpoint through POST\-response data$/) do
  response_hash = JSON.parse(@response.body)

  #Data used in the endpoint
  @cnpj_megaRoute = response_hash[0]["carrierCnpj"].to_i
  @branchID = response_hash[0]["branch"].to_i
  @contractID = response_hash[0]["contractId"].to_i
  @regionID = response_hash[0]["id"].to_s
end


When(/^format the body from POST\-reponse passing the field "([^"]*)" equal "([^"]*)"$/) do |field, value|

  case  field
    when  "carrierCnpj"
        @cnpj_megaRoute = value.to_i

    when  "branch"
        @branchID = value.to_i

    when  "contractId"
        @contractID = value.to_i

    when  "id"
        @regionID = value.to_i

  end
end

And(/^region should be deleted from database$/) do

  queryDB = Aldebaran_Carriers.new.get_regions(@cnpj_megaRoute.to_i, @branchID.to_i, @contractID.to_i,@regionID)

  count_zipcodes = queryDB[0]["COUNT_REGION"].to_f

  #Check if the region has been deleted - Should NOT find anything
  expect(count_zipcodes.to_i).to be  0

end



