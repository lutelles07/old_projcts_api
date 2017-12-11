Given(/^I create a body containing valid data$/) do
  @hashBody_Carrier = CarriersData.create_carrier
end


When(/^POST in carriers passing a "([^"]*)" authentication$/) do |authentication|
  #Document (CNPJ)
  @id_cnpj_carrier = @hashBody_Carrier["partnerData"]["cnpj"]
  @response = CarriersAPI.new(authentication).post_carriers(@id_cnpj_carrier,@hashBody_Carrier)
  Debug.new.debug(@response)
end


Given(/^Entering in carrier body the field "([^"]*)" equal "([^"]*)" in the block "([^"]*)"$/) do |field, value, block|


  if  block.to_s == "root"

    case  field.to_s
      when  "name",
            "label",
            "occurrenceType",
            "isActive",
            "sourceId",
            "transitTimeType",
            "saveDate",
            "hasOwnFleet",
            "issuesCTRC",
            "transportationMeanType",
            "serviceMakerType",
            "icmsTaxPayer"
            @hashBody_Carrier = CarriersData.invalid_carrier_root(field, value)
    end

  elsif  block.to_s == "insurance"

    case  field.to_s
      when  "type",
            "amount"
            @hashBody_Carrier = CarriersData.invalid_carrier_insurance(field, value)
    end

  elsif  block.to_s == "goals"

    case  field.to_s
      when  "delay",
            "serviceLevel"
            @hashBody_Carrier = CarriersData.invalid_carrier_goals(field, value)
    end


  elsif  (block.to_s == "gatheringRate" ||
          block.to_s == "adValorem"     ||
          block.to_s == "toll"          ||
          block.to_s == "minimumWeight" ||
          block.to_s == "cubedWeight"   ||
          block.to_s == "minimumAmount" ||
          block.to_s == "redelivery"    ||
          block.to_s == "return"        ||
          block.to_s == "maximumAmountPerInvoice")
          @hashBody_Carrier = CarriersData.invalid_carrier_subLevel_freightCalculation(field, value, block)

  elsif  (block.to_s == "partnerData" )
          @hashBody_Carrier = CarriersData.invalid_carrier_subLevel2_partnerData(field, value)

  elsif  (block.to_s == "address" )
          @hashBody_Carrier = CarriersData.invalid_carrier_subLevel3_partnerData(field, value, block)

  elsif  (block.to_s == "trackingUpdate" )
          @hashBody_Carrier = CarriersData.invalid_carrier_trackingUpdate(field, value)
  end

end
