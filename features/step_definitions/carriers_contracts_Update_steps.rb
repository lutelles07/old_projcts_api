Given(/^GET cnpj carriers\-contracts\-transportadoras from database$/) do
  carriers_repository = Aldebaran_Carriers.new
  carriers_transportadora_list = carriers_repository.get_cnpj_contracts_transportadora
  index = rand(0..(carriers_transportadora_list.length-1))

  @branch_sql = carriers_transportadora_list[index]["BRANCH"].to_i
  @cnpj_sql   = carriers_transportadora_list[index]["CNPJ"].to_i
  @id_sql     = carriers_transportadora_list[index]["ID"].to_i

  #Format the contract from template
  @hashBody_Carrier = Carriers_contract.update_contract
  @hashBody_Carrier["freightPayer"]["cnpj"] = @cnpj_sql
end


When(/^PUT in carriers\-contracts\-update passing a "([^"]*)" authentication$/) do |authentication|
  carriersContract = CarriersAPI.new(authentication)

  @response = carriersContract.put_carriers_contracts(@cnpj_sql, @branch_sql, @id_sql, @hashBody_Carrier)

  Debug.new.debug(@response)
end


And(/^Carriers\-body\-put should contain valid data$/) do

  expect(@hashBody_Carrier['freightPayer']['cnpj']).to eq @response['carrierCnpj']
  expect(@branch_sql).to eq @response['branch']
  expect(@id_sql ).to eq @response['id']
end