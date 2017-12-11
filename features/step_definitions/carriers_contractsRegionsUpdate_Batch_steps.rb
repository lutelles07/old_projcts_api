And(/^format contract for update region\-batch entering regionID equal "([^"]*)"$/) do |regionID|

  #Create Template (hash) for a region
  @hashBody_Carrier = Carriers_update.update_contract_01_region_batch
  @hashBody_Carrier["regions"][0]["megaRouteId"] = @megaRouteID
  @hashBody_Carrier["regions"][0]["id"] = regionID.to_i

  @regionID = regionID
end


When(/^PUT in carriers\-regions\-update\-batch passing a "([^"]*)" authentication$/) do |authentication|

  carriersRegions= Aldebaran_carriers_contract_regions.new(authentication)

  @response = carriersRegions.putBatch(@cnpj_megaRoute.to_i, @branchID.to_i, @contractID.to_i, @hashBody_Carrier)

  Debug.new.debug(@response)
end


And(/^Carriers\-contracts\-regions\-ID should contain valid data$/) do

  response_hash = JSON.parse(@response.body)

  i = 0
  while i < response_hash.length
    expect(@response[i]['branch']).to eq @branchID
    expect(@response[i]['carrierCnpj']).to eq @cnpj_megaRoute
    expect(@response[i]['contractId']).to eq @contractID
    expect(@response[i]['id']).to eq @regionID.to_i
    i += 1
  end
end