Given(/^GET cnpj carriers\-contracts\-regions from database$/) do
  carriers_repository = Aldebaran_Carriers.new

  #Get MegaRoutes and Transportadora data (join between these two tables)
  @carriers_list = carriers_repository.get_cnpj_contracts_cnpj

  index = rand(0..(@carriers_list.length-1))

  #Data used in the endpoint
  @cnpj_megaRoute = @carriers_list[index]["CNPJ"].to_i
  @megaRouteID = @carriers_list[index]["ROUTEID"].to_s
  @branchID = @carriers_list[index]["BRANCH"].to_i
  @contractID = @carriers_list[index]["ID"].to_i
end


And(/^format only a region$/) do

  #Create Template (hash) for a region
  @hashBody_Carrier = Carriers_regions.create_contract_01_region
  @hashBody_Carrier["regions"][0]["megaRouteId"] = @megaRouteID
end


And(/^format two regions$/) do

  #Create Template (hash) for two regions
  @hashBody_Carrier = Carriers_regions.create_contract_02_regions

  #Procedure to create an array regarding CNPJ which was selected previously
  @select_body = []

  i =  0
  j = -1

  while i < @carriers_list.length

    @carriers_list[i].each do |key, val|

      if key == "CNPJ" && val == @cnpj_megaRoute
        j += 1
        @select_body[j] = @carriers_list[i]
      end

      i += 1

    end
  end

  #Get megaRouteId from datatable
  @hashBody_Carrier["regions"][0]["megaRouteId"] = @select_body[rand(0..(@select_body.length-1))]["ROUTEID"]
  @hashBody_Carrier["regions"][1]["megaRouteId"] = @select_body[rand(0..(@select_body.length-1))]["ROUTEID"]
end


When(/^POST in carriers\-contracts\-regions passing a "([^"]*)" authentication$/) do |authentication|
  carriersRegions= Aldebaran_carriers_contract_regions.new(authentication)

  @response = carriersRegions.post(@cnpj_megaRoute.to_i, @branchID.to_i, @contractID.to_i, @hashBody_Carrier)

  Debug.new.debug(@response)
end


And(/^Carriers\-contracts\-regions should contain valid data$/) do

  response_hash = JSON.parse(@response.body)

  i = 0
  while i < response_hash.length
    expect(@response[i]['branch']).to eq @branchID
    expect(@response[i]['carrierCnpj']).to eq @cnpj_megaRoute
    expect(@response[i]['contractId']).to eq @contractID
    i += 1
  end


  #Validate ID when body has one region only
  if response_hash.length == 1

    #Check if "id" is correct
    queryDB = Aldebaran_Carriers.new.count_all_regions(@cnpj_megaRoute.to_i, @branchID.to_i, @contractID.to_i)
    count_zipcodes = queryDB[0]["COUNT_REGION"].to_f
    expect(@response[0]['id']).to be  count_zipcodes.to_i
  end

end


When(/^Entering in carrier\-contracts\-regions body the field "([^"]*)" equal "([^"]*)"$/) do |field, value|


  case  field.to_s
    when  "id",
        "name",
        "averageDistanceKm",
        "clearanceFee",
        "transitTime",
        "megaRouteId",
        "returnTransitTime",
        "maxWeight",
        "cubage",
        "maxVolume",
        "status",
        "reverseTransitTime",
        "carrierCode",
        "exchangeGatheringOnDelivery"
      @hashBody_Carrier_formatted = Carriers_regions.input_value_root_for_01_region(field, value, @hashBody_Carrier)

    when  "user",
        "dateTime"
      @hashBody_Carrier_formatted = Carriers_regions.input_value_subLevel_for_01_region(field, value, @hashBody_Carrier)

  end

  @hashBody_Carrier = @hashBody_Carrier_formatted

end