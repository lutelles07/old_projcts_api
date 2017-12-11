Given(/^GET Buyingcosts Id from database$/) do
  buyingcosts_list = BuyingCostsRepository.new.get_buyingcosts_list
  @buyingcosts = buyingcosts_list[Random.new.rand(buyingcosts_list.size)]

end

When(/^GET in Buyingcosts by id passing a "([^"]*)" authentication$/) do |authentication|
  buyingcostsContract = BuyingcostsAPI.new(authentication)

  planta = @buyingcosts["PLANTA"]
  sku = @buyingcosts["SKU"].to_s

  #Passing IDs from database
  @response = buyingcostsContract.get(planta, sku)

  Debug.new.debug(@response)
end


Then(/^Compare Buyingcosts service response with database$/) do
  @response["cmv"].should == @buyingcosts["CUSTO_MEDIO"].to_f
end


When(/^GET in Buyingcosts by the field planta\-id equal "([^"]*)" with the field equal "([^"]*)" passing a "([^"]*)" authentication$/) do |planta, sku, authentication|
  buyingcostsContract = BuyingcostsAPI.new(authentication)
  @response = buyingcostsContract.get(planta, sku)

  Debug.new.debug(@response)
end