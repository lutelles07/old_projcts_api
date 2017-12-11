
Given(/^GET SKU Id from database$/) do
  $id = ProductRepository.new.get_sku_from_database
  #@product = Product.new($id)
end

Given(/^GET EAN Id from database$/) do
  @ean_id = ProductRepository.new.get_ean
end

When(/^GET in product server for Id with "([^"]*)" user$/) do |authentication|
  @response = ProductService.new(authentication).product_by_sku
end

Then(/^Verify product Response$/) do
  @product_data_base = ProductRepository.new.get_product_by_sku($id)
  expect(@response['sku']).to eq @product_data_base['ITEG_ID'].to_s
  expect(@response['name']).to eq @product_data_base['ITEG_NOME']
  @response['eans'].each do |ean|
  @list_ean = ProductRepository.new.get_ean_list_by_sku(@response['sku'])
  expect(ean).to eq @list_ean[0]['EAN_ID_EAN'].to_s
  end
  expect(@response['weight']).to eq @product_data_base['ITEG_PESO_BRUTO'].to_f
  expect(@response['warrantyPeriod']).to eq @product_data_base['ITEG_PZ_MESES_FABR'].to_f
  expect(@response['supplierSku']).to eq @product_data_base['ITEG_COD_FORNEC']
  expect(@response['links'][0]['rel']).to eq "manufacturers"
  expect(@response['links'][0]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{@response['sku']}/manufacturers")
  expect(@response['links'][1]['rel']).to eq "departments"
  expect(@response['links'][1]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{@response['sku']}/departments")
  expect(@response['links'][2]['rel']).to eq "subdepartment"
  expect(@response['links'][2]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{@response['sku']}/subdepartment")
  expect(@response['links'][3]['rel']).to eq "self"
  expect(@response['links'][3]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{@response['sku']}")
  expect(@response['links'][4]['rel']).to eq "mainSupplier"
  expect(@response['links'][4]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{@response['sku']}/suppliers/#{@product_data_base['CLIE_ID_TERCEIRO']}")
  expect(@response['links'][5]['rel']).to eq "suppliers"
  expect(@response['links'][5]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{@response['sku']}/suppliers")
end

When(/^GET in product manufacturers server for Id with "([^"]*)" user$/) do |authentication|
  @response = ProductService.new(authentication).get_manufacturer
end

Then(/^Verify products response manufacturers$/) do
  @manufacturers = ProductRepository.new.get_manufacturer($id)
  expect(@response['manufacturers'][0]['id']).to eq @manufacturers[0]['FABRICANTE_CNPJ']
  expect(@response['manufacturers'][0]['name']).to eq @manufacturers[0]['FABRICANTE_NOME']
  expect(@response['links'][0]['rel']).to eq "product"
  expect(@response['links'][0]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{$id}")
  expect(@response['links'][1]['rel']).to eq "self"
  expect(@response['links'][1]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{$id}/manufacturers")
end

When(/^GET in product departments server for Id with "([^"]*)" user$/) do |authentication|
  @response = ProductService.new(authentication).get_departments
end

Then(/^Verify products response departments$/) do
  @departments = ProductRepository.new.get_deparments($id)
  expect(@response['departments'][0]['id']).to eq @departments[0]['DEPA_ID_DEPTO']
  expect(@response['departments'][0]['name']).to eq @departments[0]['DEPA_NOME']
  expect(@response['links'][0]['rel']).to eq "product"
  expect(@response['links'][0]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{$id}")
  expect(@response['links'][1]['rel']).to eq "self"
  expect(@response['links'][1]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{$id}/departments")
end

When(/^GET in products subdepartment server for Id with "([^"]*)" user$/) do |authentication|
  @response = ProductService.new(authentication).get_subdepartment
end

Then(/^Verify products response subdepartment$/) do
  @subdepartments = ProductRepository.new.get_sub_department($id)
  expect(@response['subdepartment']['departmentId']).to eq @subdepartments['SETO_ID_DEPTO']
  expect(@response['subdepartment']['id']).to eq @subdepartments['SETO_ID_SETOR']
  expect(@response['subdepartment']['name']).to eq @subdepartments['SETO_NOME']
  expect(@response['links'][0]['rel']).to eq "product"
  expect(@response['links'][0]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{$id}")
  expect(@response['links'][1]['rel']).to eq "self"
  expect(@response['links'][1]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{$id}/subdepartment")
end

When(/^GET in products suppliers server for Id with "([^"]*)" user$/) do |authentication|
  @response = ProductService.new(authentication).get_suppliers
end

Then(/^Verify products response suppliers$/) do
  @suppliers = ProductRepository.new.get_cnpj_suppliers($id)
  expect(@response['suppliers'][0]['cnpj']).to eq @suppliers[0]['ITFO_ID_FORNECEDOR'].to_s
  expect(@response['suppliers'][0]['name']).to eq @suppliers[0]['CLIE_NOME']
  expect(@response['links'][0]['rel']).to eq "product"
  expect(@response['links'][0]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{$id}")
  expect(@response['links'][1]['rel']).to eq "self"
  expect(@response['links'][1]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{$id}/suppliers")
end

Given(/^GET SKU Id and CNPJ from database$/) do
  $id = ProductRepository.new.get_sku_from_database
  $id_cnpj = ProductRepository.new.get_product_by_sku($id)
end

When(/^GET in products suppliers server for cnpj with "([^"]*)" user$/) do |authentication|
  @response = ProductService.new(authentication).get_suppliers_cnpj
end

Then(/^Verify products response suppliers_cnpj$/) do
  @suppliers = ProductRepository.new.get_cnpj_suppliers($id)
  expect(@response['cnpj']).to eq @suppliers[0]['ITFO_ID_FORNECEDOR'].to_s
  expect(@response['name']).to eq @suppliers[0]['CLIE_NOME']
  expect(@response['links'][0]['rel']).to eq "product"
  expect(@response['links'][0]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{$id}")
  expect(@response['links'][1]['rel']).to eq "self"
  expect(@response['links'][1]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{$id}/suppliers/#{@suppliers[0]['ITFO_ID_FORNECEDOR']}")
end

When(/^GET in products suppliers server for id and limit null with "([^"]*)" user$/) do |authentication|
  @response = ProductService.new(authentication).get_product_by_sku_and_limit_null
end

Then(/^Verify products response suppliers for pages$/) do
  @response['products'].each do |sku|
    @data_base = ProductRepository.new.get_product_by_sku(sku["sku"])
    expect(sku['sku']).to eq @data_base['ITEG_ID'].to_s
    expect(sku['name']).to eq @data_base['ITEG_NOME']
    @ean_data_base = ProductRepository.new.get_ean_list_by_sku(sku["sku"])
    @ean_data_base.each_with_index do |ean, index|
      expect(sku['eans'][index].include?(ean['EAN_ID_EAN'].to_s)).to eq true
    end
    expect(sku['weight']).to eq @data_base['ITEG_PESO_BRUTO'].to_f
    expect(sku['warrantyPeriod']).to eq @data_base['ITEG_PZ_MESES_FABR'].to_f
    expect(sku['supplierSku']).to eq @data_base['ITEG_COD_FORNEC']
    expect(sku['links'][0]['rel']).to eq "manufacturers"
    expect(sku['links'][0]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{sku['sku']}/manufacturers")
    expect(sku['links'][1]['rel']).to eq "departments"
    expect(sku['links'][1]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{sku['sku']}/departments")
    expect(sku['links'][2]['rel']).to eq "subdepartment"
    expect(sku['links'][2]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{sku['sku']}/subdepartment")
    expect(sku['links'][3]['rel']).to eq "self"
    expect(sku['links'][3]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{sku['sku']}")
    expect(sku['links'][4]['rel']).to eq "mainSupplier"
    expect(sku['links'][4]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{sku['sku']}/suppliers/#{@data_base['CLIE_ID_TERCEIRO']}")
    expect(sku['links'][5]['rel']).to eq "suppliers"
    expect(sku['links'][5]['href']).to eq (ENVIRONMENT['server']+"/aldebaran-products/products/#{sku['sku']}/suppliers")
  end
end

Then(/^Response should have at index zero link first with value "([^"]*)"$/) do |endpoint|
  expect(@response['links'][0]['rel']).to eq "first"
  expect(@response['links'][0]['href']).to eq ENVIRONMENT['server']+endpoint
end

Then(/^Response should have at index one link next with value "([^"]*)"$/) do |endpoint|
  expect(@response['links'][1]['rel']).to eq "next"
  expect(@response['links'][1]['href']).to eq ENVIRONMENT['server']+endpoint
end

When(/^GET in products server with higher than allowed "([^"]*)" user$/) do |authentication|
  @response = ProductService.new(authentication).get_product_by_sku_and_limit_101
end

When(/^GET in products server for path "([^"]*)" with "([^"]*)" user$/) do |limit, authentication|
  @response = ProductService.new(authentication).get_product_by_sku_and_limit_1(limit)
end
