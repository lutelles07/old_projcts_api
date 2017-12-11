And(/^format contract for update a region entering regionID equal "([^"]*)"$/) do |regionID|

  #Create Template (hash) for a region
  @hashBody_Carrier = Carriers_update.update_contract_01_region
  @hashBody_Carrier["regions"][0]["megaRouteId"] = @megaRouteID

  @regionID = regionID
end


When(/^PUT in carriers\-regions\-update\-id passing a "([^"]*)" authentication$/) do |authentication|

  carriersRegions= Aldebaran_carriers_contract_regions.new(authentication)

  @response = carriersRegions.putID(@cnpj_megaRoute.to_i, @branchID.to_i, @contractID.to_i, @regionID, @hashBody_Carrier)

  Debug.new.debug(@response)
end