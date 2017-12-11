Given(/^GET cnpj carriers from database$/) do
  carriers_cnpj_list = Aldebaran_Carriers.new.get_cnpj_contracts
  index = rand(0..(carriers_cnpj_list.length-1))
  @cnpj_carriers = carriers_cnpj_list[index]["CLEN_ID_TERCEIRO"].to_i

  #Format the body
  @hashBody_Carrier = Carriers_contract.create_contract
  @hashBody_Carrier["freightPayer"]["cnpj"] = @cnpj_carriers
end


When(/^POST in carriers\-contracts passing a "([^"]*)" authentication$/) do |authentication|
  @response = CarriersAPI.new(authentication).post_carriers_contracts(@cnpj_carriers,@hashBody_Carrier)
  Debug.new.debug(@response)
end


And(/^Validate carriers\-contracts data$/) do
  expect(@hashBody_Carrier['freightPayer']['cnpj']).to eq @response['carrierCnpj']
  expect(@hashBody_Carrier['branch']).to eq @response['branch']
end


When(/^Entering in carrier\-contracts body the field "([^"]*)" equal "([^"]*)" in the block "([^"]*)"$/) do |field, value, block|
  if  block.to_s == "root"
    case  field.to_s
      when  "branch",
          "name",
          "isActive",
          "externalLabel",
          "freightCalculationDocument",
          "deliveryType",
          "transportType",
          "isShipment",
          "exchangeGatheringOnDelivery",
          "sourceId",
          "invoiceIssuerCnpj",
          "isOrs",
          "isInternationalFreightForwarder",
          "requestsIdentificationOfRecipient",
          "issuesIncomingInvoiceOnGathering",
          "displaysDeliveriesOnControlPanel",
          "standardDeadlineForOccurrences",
          "freightValuesWithoutIcms"
        @hashBody_Carrier_formatted = Carriers_contract.formatting_carrier_root(field, value, @hashBody_Carrier)
    end

  elsif block.to_s == "effectiveDates" ||
      block.to_s == "freightPayer"   ||
      block.to_s == "worksOn"        ||
      block.to_s == "trackingUpdate"

    case  field.to_s
      when  "start",
          "dueTo",
          "type",
          "cnpj",
          "saturdays",
          "sundays",
          "holidays",
          "user",
          "dateTime"

        @hashBody_Carrier_formatted = Carriers_contract.formatting_carrier_level2(field, value, block, @hashBody_Carrier)
    end

  end

  @hashBody_Carrier = @hashBody_Carrier_formatted

end
