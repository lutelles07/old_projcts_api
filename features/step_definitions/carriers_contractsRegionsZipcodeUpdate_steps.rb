Given(/^GET cnpj carriers\-contracts\-regions\-zipcodes from database$/) do

  carriers_repository = Aldebaran_Carriers.new

  #Get MegaRoutes and Transportadora data (join between these two tables)
  @zipcode_list = carriers_repository.get_zipcodes
  index = rand(0..(@zipcode_list.length-1))

  #Data used in the endpoint
  @cnpj       = @zipcode_list[index]["CNPJ"].to_i
  @regionID   = @zipcode_list[index]["REGION"].to_s
  @branchID   = @zipcode_list[index]["BRANCH"].to_i
  @contractID = @zipcode_list[index]["CONTRACTID"].to_i
  @cepini     = @zipcode_list[index]["CEPINI"].to_i
  @cepfim     = @zipcode_list[index]["CEPFIM"].to_i

  @hashBody_Carrier = Carriers_zipcodes.update_zipcode
end


When(/^PUT in carriers\-regions\-zipcode passing a "([^"]*)" authentication$/) do |authentication|
  carriersZipcode = Carriers_contract_regions.new(authentication)

  @response = carriersZipcode.put(@cnpj.to_i, @branchID.to_i, @contractID.to_i,@regionID, @cepini, @cepfim, @hashBody_Carrier)

  Debug.new.debug(@response)
end


And(/^zipcode should be updated in database$/) do

  zipMin = 0
  zipMax = 0

  #When passing a null or empty zipcode, the system will consider the old one
  if (@hashBody_Carrier["newZipMin"] != nil && @hashBody_Carrier["newZipMin"] != "")
    #new zipcode passed in the body (not null)
    zipMin = @hashBody_Carrier["newZipMin"]
  else
    #old zipcode (equal null)
    zipMin = @cepini
  end


  #When passing a null or empty zipcode, the system will consider the old one
  if  (@hashBody_Carrier["newZipMax"] != nil && @hashBody_Carrier["newZipMax"] != "")
    #new zipcode passed in the body (not null)
    zipMax = @hashBody_Carrier["newZipMax"]
  else
    #old zipcode (equal null)
    zipMax = @cepfim
  end

  carriers_repository = Aldebaran_Carriers.new

  #Access Database to check whether the zipcodes have been updated successfully
  @zipcode_count = carriers_repository.count_zipcodes(@cnpj,@branchID, @contractID, @regionID, zipMin,zipMax)

  count_zipcodes = @zipcode_count[0]["COUNT_UPDATED_ZIPCODES"].to_f

  #Only 1 row should be updated
  expect(count_zipcodes).to be  1.0

  #----------------------------------------------------#
  #    ---> Match body and database (Validation)
  #----------------------------------------------------#

  queryDB = carriers_repository.match_zipcodes(@cnpj,@branchID, @contractID, @regionID, zipMin,zipMax)[0]

  #==> CepIni
  expect(@hashBody_Carrier["newZipMin"]).to eq queryDB["TCRC_CEP_INI"]

  #==> CepFim
  expect(@hashBody_Carrier["newZipMax"]).to eq queryDB["TCRC_CEP_FIM"]

  #==> status
  expect(@hashBody_Carrier["status"]).to eq queryDB["TCRC_SITUACAO"]

  #==> expirationDate (Compare only Date)
  if  (@hashBody_Carrier["expirationDate"] != nil && @hashBody_Carrier["expirationDate"] != "")
    dtexpiration = @hashBody_Carrier["expirationDate"].to_s[0..9]
  else
    dtexpiration = ""
  end

  expect(dtexpiration).to eq (queryDB["TCRC_DT_SUSPENSAO"]).to_s[0..9]

  #==> comments
  if  (@hashBody_Carrier["comments"] != nil && @hashBody_Carrier["comments"] != "")
    comments = @hashBody_Carrier["comments"]
  else
    comments = nil
  end

  expect(comments).to eq queryDB["TCRC_OBS"]

  #==> dateTime (Compare only Date)
  expect((@hashBody_Carrier["trackingUpdate"]["dateTime"]).to_s[0..9]).to eq (queryDB["TCRC_DATAHORA"]).to_s[0..9]

end


When(/^Entering in carrier\-contracts\-zipcodes for update in which the field "([^"]*)" equal "([^"]*)"$/) do |field, value|

  case  field.to_s
    when  "newZipMin",
          "newZipMax",
          "status",
          "expirationDate",
          "comments"
          @hashBody_Carrier_formatted = Carriers_zipcodes.update_values_zipcode_root(field, value, @hashBody_Carrier)

    when  "user",
          "dateTime"
          @hashBody_Carrier_formatted = Carriers_zipcodes.update_values_zipcode_trackingUpdate(field, value, @hashBody_Carrier)
  end

  @hashBody_Carrier = @hashBody_Carrier_formatted
end
