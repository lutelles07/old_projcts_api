When(/^GET in B2BContractTypes for "([^"]*)" passing a "([^"]*)" authentication$/) do |field, authentication|
  @response = B2BcontracttypesAPI.new(authentication).get(field)
  Debug.new.debug(@response)
end

Given(/^GET Aldebaran\-B2BContractTypes "([^"]*)" from database$/) do |path|
  #Get data form database
  case path
    when "billingtypes"
      @contract_type_list = B2BContractTypesRepository.new.get_billing_types_list
    when "shippingcategories"
      @contract_type_list = B2BContractTypesRepository.new.get_shipping_categories
    when "paymentmethods"
      @contract_type_list = B2BContractTypesRepository.new.get_payment_methods
    when "saleschannels"
      @contract_type_list = B2BContractTypesRepository.new.get_sales_channels
  end
end

Then(/^Compare B2BContractTypes service response with database$/) do
  @contract_type_list = Utils.new.sort_array(@contract_type_list, "id")
  @response = Utils.new.sort_array(@response, "id")
  @contract_type_list.each_index do |index|
    expect(@contract_type_list[index]["ID"]).to eq @response[index]["id"]
    expect(@contract_type_list[index]["NAME"]).to eq @response[index]["name"]
  end
end
