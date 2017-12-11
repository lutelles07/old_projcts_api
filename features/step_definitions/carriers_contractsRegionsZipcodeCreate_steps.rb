When (/^format contract\-regions\-zipcodes passing regionID equal "([^"]*)"$/) do |regionID|

  @regionID = regionID

  #Create Template (hash) for a region
  @hashBody_Carrier = Carriers_zipcodes.create_contract_01_region_zipcode
end


When(/^POST in carriers\-regions\-zipcode passing a "([^"]*)" authentication$/) do |authentication|
  carriersZipcode = Carriers_contract_regions.new(authentication)
  @response = carriersZipcode.post(@cnpj_megaRoute.to_i, @branchID.to_i, @contractID.to_i,@regionID, @hashBody_Carrier)

  Debug.new.debug(@response)
end


And(/^compare carriers\-zipcode with database$/) do

  @cepini     = @hashBody_Carrier["zipCodes"][0]["zipMin"]
  @cepfim      = @hashBody_Carrier["zipCodes"][0]["zipMax"]

  carriers_repository = Aldebaran_Carriers.new

  #Access Database to check whether the zipcodes have been created successfully
  @zipcode_count = carriers_repository.count_zipcodes(@cnpj_megaRoute.to_i,@branchID.to_i, @contractID.to_i, @regionID.to_i, @cepini,@cepfim)

  count_zipcodes = @zipcode_count[0]["COUNT_UPDATED_ZIPCODES"].to_f

  #Only 1 row should be created
  expect(count_zipcodes).to be  1.0

  #Access database to get the created zipcode data
  queryDB = carriers_repository.match_zipcodes(@cnpj_megaRoute.to_i,@branchID.to_i, @contractID.to_i, @regionID.to_i, @cepini,@cepfim)[0]

  #==> CepIni
  expect(@hashBody_Carrier["zipCodes"][0]["zipMin"]).to eq queryDB["TCRC_CEP_INI"]

  #==> CepFim
  expect(@hashBody_Carrier["zipCodes"][0]["zipMax"]).to eq queryDB["TCRC_CEP_FIM"]

  #==> status
  expect(@hashBody_Carrier["zipCodes"][0]["status"]).to eq queryDB["TCRC_SITUACAO"]

  #==> expirationDate (Compare only Date)
  if  (@hashBody_Carrier["zipCodes"][0]["expirationDate"] != nil && @hashBody_Carrier["zipCodes"][0]["expirationDate"] != "")
      dtexpiration = @hashBody_Carrier["zipCodes"][0]["expirationDate"].to_s[0..9]
  else
      dtexpiration = ""
  end

  expect(dtexpiration).to eq (queryDB["TCRC_DT_SUSPENSAO"]).to_s[0..9]

  #==> comments
  if  (@hashBody_Carrier["zipCodes"][0]["comments"] != nil && @hashBody_Carrier["zipCodes"][0]["comments"] != "")
      comments = @hashBody_Carrier["zipCodes"][0]["comments"]
  else
      comments = nil
  end

  expect(comments).to eq queryDB["TCRC_OBS"]

  #==> dateTime (Compare only Date)
  expect((@hashBody_Carrier["zipCodes"][0]["trackingUpdate"]["dateTime"]).to_s[0..9]).to eq (queryDB["TCRC_DATAHORA"]).to_s[0..9]

  #==> RegionID
  expect(@regionID.to_i).to eq queryDB["TCRC_ID_REGIAO"]

  #==> Nro Documento
  expect(@contractID.to_i).to eq queryDB["TCRC_ID_CONTRATO"]

  #==> Transportadora (MegaRoute)
  expect(@cnpj_megaRoute.to_i).to eq queryDB["TCRC_ID_TRANSPORTADORA"]

  #==> branch (Filial)
  expect(@branchID.to_i).to eq queryDB["TCRC_ID_ESTABELECIMENTO"]
end


When(/^Entering in carrier\-contracts\-zipcodes body the field "([^"]*)" equal "([^"]*)"$/) do |field, value|

  case  field.to_s
    when  "zipMin",
        "zipMax",
        "status",
        "expirationDate",
        "comments"
      @hashBody_Carrier_formatted = Carriers_zipcodes.input_value_root_zipcode_01_region(field, value, @hashBody_Carrier)

    when  "user",
        "dateTime"
      @hashBody_Carrier_formatted = Carriers_zipcodes.input_subLevel_zipcode_01_region(field, value, @hashBody_Carrier)

  end

  @hashBody_Carrier = @hashBody_Carrier_formatted
end


When(/^Entering in carrier\-contracts\-zipcodes body the field "([^"]*)" equal "([^"]*)" with "([^"]*)" equal "([^"]*)"$/) do |status, statusValue, expirationDate, dateValue|

  @hashBody_Carrier["zipCodes"][0][status] = statusValue.to_s

  case dateValue.to_s
    when  "null"
      @hashBody_Carrier["zipCodes"][0][expirationDate] = nil

    when  "empty"
      @hashBody_Carrier["zipCodes"][0][expirationDate] = ""
  end
end
