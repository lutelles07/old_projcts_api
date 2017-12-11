When(/^DELETE in carriers\-regions\-zipcode passing a "([^"]*)" authentication$/) do |authentication|

  carriersZipcode = Carriers_contract_regions.new(authentication)

  @response = carriersZipcode.delete(@cnpj.to_i, @branchID.to_i, @contractID.to_i,@regionID, @cepini, @cepfim)

  Debug.new.debug(@response)
end


And(/^zipcode should be delete from database$/) do

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

  #Access Database to check whether the zipcodes have been deleted successfully
  @zipcode_count = carriers_repository.count_zipcodes(@cnpj,@branchID, @contractID, @regionID, zipMin,zipMax)

  count_zipcodes = @zipcode_count[0]["COUNT_UPDATED_ZIPCODES"].to_f

  #The row should be deleted
  expect(count_zipcodes).to be  0.0
end


When(/^Entering the field "([^"]*)" equal "([^"]*)" in the URL$/) do |field, value|


  case  value.to_s
    when  "empty"

      if  field.to_s == "zipMin"
        @cepini = ""
      elsif  field.to_s == "zipMax"
        @cepfim = ""
      end

    when  "null"

      if  field.to_s == "zipMin"
        @cepini = nil
      elsif  field.to_s == "zipMax"
        @cepfim = nil
      end

    when  "string"

      if  field.to_s == "zipMin"
        @cepini = "12345678A"
      elsif  field.to_s == "zipMax"
        @cepfim = "12345678A"
      end

    else

      if  field.to_s == "zipMin"
        @cepini = value
      elsif  field.to_s == "zipMax"
        @cepfim = value
      end

  end

end