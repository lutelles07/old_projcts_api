Given(/^GET Estoque Id from database$/) do
  @returnitems_queries = YAML::load(File.open('database_queries/returnitems.yml'))
  query = @returnitems_queries["get_return_item_id"]
  estoque_id_list = DatabaseService.new.execute_query(query)
  $id = estoque_id_list[Random.new.rand(estoque_id_list.size)]["ETIQ_RG"].gsub(" ","")
  query = @returnitems_queries['get_return_item'].gsub("<ETIQ_RG>", $id)
  @return_item = DatabaseService.new.execute_query(query)
end

When(/^do I make a query for an item in the return items api whit user "([^"]*)"$/) do |authentication|
  @response = ReturnItemService.new(authentication).get_returnitems
  Debug.new.debug(@response)
end

Then(/^I valid response body by returnItems$/) do
  expect(@response['id']).to eq $id
  expect(@response['orderId']).to eq @return_item[0]["ID_PED_CLIENTE"].to_i
  expect(@response['deliveryId']).to eq @return_item[0]["ID_PED_ENTREGA"].to_i
  date = @response['deliveryDate'].split('T')
  date_banco = @return_item[0]['DT_ENTREGA'].to_s.split(' ')
  expect(date[0]).to eq date_banco[0]
  expect(@response['links'][0]['rel']).to eq "product"
  url_products = @response['links'][0]['href']
  env_products, iditem = url_products.match(%r{https://vip-aldebaran-olimpo\.(qa|stg)\.vmcommerce\.intra/aldebaran-products/products/(\d+)}i).captures
  expect(env_products).to eq ENV['ENV']
  expect(iditem).to eq @return_item[0]['ID_ITEM'].to_s
  expect(@response['links'][1]['rel']).to eq "returnInvoice"
  url_returninvoice = @response['links'][1]['href']
  env_returninvoice, filial_dev, id_nota_dev, serie_dev = url_returninvoice.match(%r{https://vip-aldebaran-olimpo\.(qa|stg)\.vmcommerce\.intra/aldebaran-invoices/invoices/1/(\d+)/(\d+)/(\d+)}i).captures
  expect(env_returninvoice).to eq ENV['ENV']
  expect(filial_dev).to eq @return_item[0]['FILIAL_DEV'].to_s
  expect(id_nota_dev).to eq @return_item[0]['ID_NOTA_DEV'].to_s
  expect(serie_dev).to eq @return_item[0]['SERIE_DEV'].to_s
  expect(@response['links'][2]['rel']).to eq "originalInvoice"
  url_originalinvoice = @response['links'][2]['href']
  env_originalinvoice, filial_orig, id_nota_orig, serie_orig = url_originalinvoice.match(%r{https://vip-aldebaran-olimpo\.(qa|stg)\.vmcommerce\.intra/aldebaran-invoices/invoices/1/(\d+)/(\d+)/(\d+)}i).captures
  expect(env_originalinvoice).to eq ENV['ENV']
  expect(filial_orig).to eq @return_item[0]['FILIAL_ORIG'].to_s
  expect(id_nota_orig).to eq @return_item[0]['ID_NOTA_ORIG'].to_s
  expect(serie_orig).to eq @return_item[0]['SERIE_ORIG'].to_s
  expect(@response['links'][3]['rel']).to eq "self"
  url_self = @response['links'][3]['href']
  env_self, id_self = url_self.match(%r{https://vip-aldebaran-olimpo\.(qa|stg)\.vmcommerce\.intra/aldebaran-returnitems/returnitems/(\d+)}i).captures
  expect(env_self).to eq ENV['ENV']
  expect(id_self).to eq @return_item[0]['ETIQ_RG'].to_i.to_s
  expect(@response['links'][4]['rel']).to eq "instance"
  url_instance = @response['links'][4]['href']
  env_instances, id_instances = url_instance.match(%r{https://vip-aldebaran-olimpo\.(qa|stg)\.vmcommerce\.intra/aldebaran-instances/instances/(\d+)}i).captures
  expect(env_instances).to eq ENV['ENV']
  expect(id_instances).to eq @return_item[0]['ID_INSTANCIA'].to_s
end

When(/^do I make a query for an item invalid whit user "([^"]*)"$/) do |authentication|
  @response = ReturnItemService.new(authentication).get_returnitems_parameter_invalid
  Debug.new.debug(@response)
end

When(/^I query for an item with the user "([^"]*)"$/) do |authentication|
  @response = ReturnItemService.new(authentication).get_returnitems_authentication_invalid
  Debug.new.debug(@response)
end

When(/^I query an item that does not exist with the "([^"]*)" user$/) do |authentication|
@response = ReturnItemService.new(authentication).get_an_item_that_does_not_exist
Debug.new.debug(@response)
end

Given(/^GET Estoque Id List from database$/) do
  etiq = ReturnItemRepository.new.get_estoque_list_from_database
  @etiq_rg = etiq[0]['ETIQ_RG'].split
end

Then(/^do resquest put in aldebaran server the "([^"]*)" user$/) do |authentication|
  @response_body = ReturnItemFactory.put_targetWarranty
  @response = ReturnItemService.new(authentication).put_targetWarranty(@etiq_rg[0], @response_body)
  Debug.new.debug(@response)
end

When(/^I make an update in target Warranty with value repeated whit "([^"]*)" user$/) do |authentication|
  @response_body = ReturnItemFactory.put_targetWarrant_value_10
  @response = ReturnItemService.new(authentication).put_targetWarranty(@etiq_rg[0], @response_body)
  @response = ReturnItemService.new(authentication).put_targetWarranty(@etiq_rg[0], @response_body)
  Debug.new.debug(@response)
end

Then(/^Response body should have code with value "([^"]*)"$/) do |code_error|
  expect(@response['code']).to eq code_error
end

When(/^I nake an update in targetWarranty with format invalid and "([^"]*)" user$/) do |authentication|
@response_body = ReturnItemFactory.put_targetWarranty
@response = ReturnItemService.new(authentication).put_an_item_that_does_not_exist(@response_body)
Debug.new.debug(@response)
end

When(/^I make an update in targetWarranty with value invalide and "([^"]*)" user$/) do |authentication|
  @response_body = ReturnItemFactory.put_targetWarrant_invalid_valie
  @response = ReturnItemService.new(authentication).put_targetWarranty(@etiq_rg[0], @response_body)
  Debug.new.debug(@response)
end

When(/^I update to targetWarranty with empty body and "([^"]*)" user$/) do |authentication|
  @response_body = nil
  @response = ReturnItemService.new(authentication).put_targetWarranty(@etiq_rg[0], @response_body)
  Debug.new.debug(@response)
end

When(/^I update the targetWarranty with "([^"]*)"$/) do |authentications|
  @response_body = ReturnItemFactory.put_targetWarranty
  @response = ReturnItemService.new(authentications).put_targetWarranty(@etiq_rg[0], @response_body)
  Debug.new.debug(@response)
end
