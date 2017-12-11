When(/^I fetch an order information from Aldebaran$/) do
  @response = response = AldebaranClient.new.order_by_id($order_id)
  @aldebaran_result = AldebaranUraResponse.response_call(@response)
end

Then(/^I will receive the return message successfull$/) do
  expect(@response).to be_successful
end


When(/^I fetch an client CPF information from Aldebaran$/) do
  #@response = AldebaranClient.new.client_by_cpf(32646829825)
  @response = AldebaranClient.new.client_by_cpf($cpf_id)
  @aldebaran_result = AldebaranUraResponse.response_call(@response)
end

When(/^I fetch an order invalid information from Aldebaran$/) do
  @response = response = AldebaranClient.new.order_by_id_invalid(12345678)
  @aldebaran_result = AldebaranUraResponse.response_call(@response)
end

When(/^I fetch an client CPF invalid information from Aldebaran$/) do
  @response = AldebaranClient.new.client_by_cpf_invalid(12345678901)
  @aldebaran_result = AldebaranUraResponse.response_call(@response)
end

When(/^I fetch an ObterItensAtualizados information from Aldebaran$/) do
  @response = AldebaranClient.new.obter_itens_atualizados
  @aldebaran_result = AldebaranUraResponse.response_call_obter_itens_atualizados(@response)
end

Then(/^I will Valid the response$/) do
  expect(@response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result]).to_not eq ""
  expect(@response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result]).to_not eq " "
  expect(@response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result]).to_not eq "{}"
  expect(@response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result]).to_not eq nil
  puts @response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result]
  a = @response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result].to_s
  b = a.split(' ')
  c = b[2].split('<CPFCNPJ>')
  cnpj = c[1].split('</CPFCNPJ>')
  expect(cnpj[0]).to eq $cpf_id.to_s
end

Then(/^I will Valid the response by cpf$/) do
  expect(@response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result]).to_not eq ""
  expect(@response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result]).to_not eq " "
  expect(@response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result]).to_not eq "{}"
  expect(@response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result]).to_not eq nil
  puts @response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result]
  a = @response.to_hash[:executar_interface_ura_response][:executar_interface_ura_result].to_s
  b = a.split(' ')
  c = b[2].split('<CPFCNPJ>')
  cnpj = c[1].split('</CPFCNPJ>')
  expect(cnpj[0]).to eq $cpf_id.to_s
end

Then(/^I will Valid the response body itens atualizados$/) do
  expect(@response.to_hash[:obter_itens_atualizados_response][:obter_itens_atualizados_result]).to_not eq ""
  expect(@response.to_hash[:obter_itens_atualizados_response][:obter_itens_atualizados_result]).to_not eq " "
  expect(@response.to_hash[:obter_itens_atualizados_response][:obter_itens_atualizados_result]).to_not eq "{}"
  expect(@response.to_hash[:obter_itens_atualizados_response][:obter_itens_atualizados_result]).to_not eq nil
  puts @response.to_hash[:obter_itens_atualizados_response][:obter_itens_atualizados_result]
end

Then(/^I will valid the invalid call response$/) do
  expect(@response.to_hash[:executar_interface_ura_response][:@xmlns]).to eq "http://tempuri.org/"
end
