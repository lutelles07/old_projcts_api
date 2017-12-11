When(/^get in stockUnit in Server for Id with "([^"]*)" user$/) do |authentication|
  @response = StockUnitService.new(authentication).get_stockunit_id
end

Then(/^compare multiple id StockUnit response with database$/) do
  @jsonParse = JSON.parse(@response.body)
  @jsonParse["items"].each do |item|
    stockunit_data = StockUnitRepository.new.get_stockunit_data(item['id'].to_s)
    expect(item['id']).to eq stockunit_data[0]['UNI_ESTQ']
    expect(item['plant']).to eq stockunit_data[0]['PLANTA']
    expect(item['inventoryLocation']).to eq stockunit_data[0]['ENDERECO']
    expect(item['inventoryLocationId']).to eq stockunit_data[0]['ID_ENDERECO']
    expect(item['warranty']).to eq stockunit_data[0]['RESTRICAO']
    expect(item['warrantyId']).to eq stockunit_data[0]['ID_RESTRICAO']
    expect(item['rg']).to eq stockunit_data[0]['RG'].to_i
    data_vencimento = stockunit_data[0]['DATA_VENCIMENTO'].to_s.split(' ')
    expect(item['expirationDate']).to eq data_vencimento[0]
    expect(item['quantity']).to eq stockunit_data[0]['QT_DISPONIVEL'].to_i
    expect(item['status']).to eq stockunit_data[0]['SITUACAO'].to_s
    expect(item['returnEntranceDate']).to eq stockunit_data[0]['DATA_ENTRADA_REVERSA']
    expect(item['storageDate']).to eq stockunit_data[0]['DATA_ARMAZENAGEM']
  end
end

When(/^get in stockUnit in Server for Id duplicate with "([^"]*)" user$/) do |authentication|
@response = StockUnitService.new(authentication).get_stockunit_id_duplicate
end

When(/^get in stockUnit in Server for querystring with "([^"]*)" user$/) do |authentication|
@response = StockUnitService.new(authentication).get_stockunit_querystring
end

When(/^get in stockUnit with multiple StockUnit id with "([^"]*)" user$/) do |authentication|
  @response = StockUnitService.new(authentication).get_stockunit_multiple_id
end

Given(/^that I make a check in the estockUnit service with id invalid and "([^"]*)" user$/) do |authentication|
  @response = StockUnitService.new(authentication).get_stockunit_id_invalid
end

Given(/^that I make an consult in stockUnit service with "([^"]*)"$/) do |authentication|
  @response = StockUnitService.new(authentication).get_stockunit_id
end

Given(/^that I consult a id invalid in stockUnit server with "([^"]*)" user$/) do |authentication|
  @response = StockUnitService.new(authentication).get_stockunit_id_resurce_not_found
end

Given(/^that I consult with some invalid parameter whit "([^"]*)" user$/) do |authentication|
  @response = StockUnitService.new(authentication).get_stockunit_querystring_parameter_invalid
end

Given(/^get in stockUnit server with querystring invalid and "([^"]*)" user$/) do |authentication|
  @response = StockUnitService.new(authentication).get_stockunit_querystring_invalid
end

Given(/^that I make a request in stockunit server without the parameter ean with "([^"]*)" user$/) do |authentication|
  @response = StockUnitService.new(authentication).stockunit_querystring_without_ean
end

Given(/^that I make a request in stockunit server without the parameter plant with "([^"]*)" user$/) do |authentication|
  @response = StockUnitService.new(authentication).stockunit_querystring_without_plant
end

Given(/^that I make a request in stockunit server without the parameter warrantyId with "([^"]*)" user$/) do |authentication|
  @response = StockUnitService.new(authentication).stockunit_querystring_without_warrantyId
end

Given(/^that I make a request in stockunit server without the parameter inventoryLocationId with "([^"]*)" user$/) do |authentication|
  @response = StockUnitService.new(authentication).stockunit_querystring_without_inventoryLocationId
end
