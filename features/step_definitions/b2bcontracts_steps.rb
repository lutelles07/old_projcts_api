When(/^POST in b2bcontracts passing a "([^"]*)" authentication$/) do |authentication|
  @json_b2bcontracts = B2BContractsFactory.post_b2bcontracts($id_client)
  @response = B2bcontractsAPI.new(authentication).post(@json_b2bcontracts)
  Debug.new.debug(@response)
end


Then(/^I valid the response body$/) do
  expect(@response['bairroCob']).to eq @json_b2bcontracts['bairroCob']
  expect(@response['canalVenda']).to eq @json_b2bcontracts['canalVenda']
  expect(@response['cepCob']).to eq @json_b2bcontracts['cepCob']
  expect(@response['cidadeCob']).to eq @json_b2bcontracts['cidadeCob']
  expect(@response['compleCob']).to eq @json_b2bcontracts['compleCob']
  expect(@response['diaFixoBoleto']).to eq @json_b2bcontracts['diaFixoBoleto']
  expect(@response['idCliente']).to eq @json_b2bcontracts['idCliente']
  expect(@response['limiteCred']).to eq @json_b2bcontracts['limiteCred']
  expect(@response['logradouroCob']).to eq @json_b2bcontracts['logradouroCob']
  expect(@response['numContrato']).to eq @json_b2bcontracts['numContrato']
  expect(@response['numSubContrato']).to eq @json_b2bcontracts['numSubContrato']
  expect(@response['numeroCob']).to eq @json_b2bcontracts['numeroCob']
  expect(@response['paisCob']).to eq @json_b2bcontracts['paisCob']
  expect(@response['periodoFat']).to eq @json_b2bcontracts['periodoFat']
  expect(@response['pzDiaCorte']).to eq @json_b2bcontracts['pzDiaCorte']
  expect(@response['pzEntrega']).to eq @json_b2bcontracts['pzEntrega']
  expect(@response['pzPagamentoBoleto']).to eq @json_b2bcontracts['pzPagamentoBoleto']
  expect(@response['tipoOperComl']).to eq @json_b2bcontracts['tipoOperComl'].to_s
  expect(@response['tipoPedido']).to eq @json_b2bcontracts['tipoPedido']
  expect(@response['ufCob']).to eq @json_b2bcontracts['ufCob']
  expect(@response['idAgencia']).to eq @json_b2bcontracts['idAgencia']
end


When(/^POST in b2bcontracts without "([^"]*)" passing a "([^"]*)" authentication$/) do |field, authentication|
  @json_b2bcontracts = B2BContractsFactory.post_b2bcontracts_without_field($id_client, field)
  @response = B2bcontractsAPI.new(authentication).post(@json_b2bcontracts)
  Debug.new.debug(@response)
end


When(/^PUT in b2bcontracts passing a "([^"]*)" authentication$/) do |authentication|
  @json = B2BContractsFactory.post_b2bcontracts($id_client)
  @response_create = B2bcontractsAPI.new(authentication).post(@json)
  expect(@response_create.code).to eq 200
  #PUT request
  @json_b2bcontracts = B2BContractsFactory.put_b2bcontracts(@json['idCliente'], @json['numContrato'], @json['numSubContrato'])
  @response = B2bcontractsAPI.new(authentication).put(@json_b2bcontracts )
  Debug.new.debug(@response)
end


When(/^PUT in b2bcontracts without "([^"]*)" passing a "([^"]*)" authentication$/) do |field, authentication|
  @json = B2BContractsFactory.post_b2bcontracts($id_client)
  b2bcontractContract = B2bcontractsAPI.new(authentication)
  #POST request
  @response_create = b2bcontractContract.post(@json)
  expect(@response_create.code).to eq 200
  #PUT request
  @json_b2bcontracts = B2BContractsFactory.put_b2bcontracts_without_field(@json['idCliente'], @json['numContrato'], @json['numSubContrato'], field)
  @response = b2bcontractContract.put(@json_b2bcontracts )
  Debug.new.debug(@response)
end


When(/^put in b2bcontracts without the idCliente passing a "([^"]*)" authentication$/) do |authentication|
  @json = B2BContractsFactory.post_b2bcontracts($id_client)
  b2bcontractContract = B2bcontractsAPI.new(authentication)
  #POST request
  @response_create = b2bcontractContract.post(@json)
  #expect(@response_create.code).to eq 200
  #PUT request
  @json_b2bcontacts = B2BContractsFactory.put_b2bcontracts_without_idCliente(@json['numContrato'], @json['numSubContrato'])
  @response = b2bcontractContract.put(@json_b2bcontacts)
  Debug.new.debug(@response)
end


When(/^put in b2bcontracts without the numContrato passing a "([^"]*)" authentication$/) do |authentication|
  @json = B2BContractsFactory.post_b2bcontracts($id_client)
  b2bcontractContract = B2bcontractsAPI.new(authentication)
  #POST request
  @response_create = b2bcontractContract.post(@json)
  expect(@response_create.code).to eq 200

  #PUT request
  @json_b2bcontacts = B2BContractsFactory.put_b2bcontracts_without_numContrato(@json['idCliente'], @json['numSubContrato'])
  @response = b2bcontractContract.put(@json_b2bcontacts)
  Debug.new.debug(@response)
end


When(/^put in b2bcontracts without the numSubContrato passing a "([^"]*)" authentication$/) do |authentication|
  @json = B2BContractsFactory.post_b2bcontracts($id_client)
  @response_create = B2bcontractsAPI.new(authentication).post(@json)
  #POST request
  expect(@response_create.code).to eq 200
  #PUT request
  @json_b2bcontacts = B2BContractsFactory.put_b2bcontracts_without_numSubContrato(@json['idCliente'], @json['numContrato'])
  @response = B2bcontractsAPI.new(authentication).put(@json_b2bcontacts)
  Debug.new.debug(@response)
end
