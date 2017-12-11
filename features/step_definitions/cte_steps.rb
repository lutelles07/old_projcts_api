Given(/^I consult a cfop in cte API with cfop the "([^"]*)" for "([^"]*)" transfer "([^"]*)"$/) do |uf_origen, uf_detino, transfer|
  @response = CteServices.new.get_cte_cfop(uf_origen, uf_detino, transfer)
end

Then(/^I should see the response body_cfop$/) do
  cfop = @response.request.last_uri.to_s.split('/')
  data_base = CteRepository.new.get_cte_cfop(cfop[6],cfop[7],cfop[8])
  expect(@response['cfop']).to eq data_base[0]['CFO_ID'].to_i
  expect(@response['seq']).to eq data_base[0]['CFO_SEQ'].to_i
  expect(@response['codeEvent']).to eq data_base[0]['CODE_EVENT']
end

Given(/^I consult a taxes in cte API with price$/) do
  @price = Faker::Number.decimal(2)
  @response = CteServices.new.get_cte_taxes(@price)
end

Then(/^the response body must contain the values of taxes and aliquot$/) do
  @taxes_aliquot = CteRepository.new.get_cte_taxes(@price)
  expect(@response['pisBase']).to eq @taxes_aliquot[0]['BASE_PIS'].to_f
  expect(@response['pisValue']).to eq @taxes_aliquot[0]['VL_PIS'].to_f
  expect(@response['pisAliquot']).to eq @taxes_aliquot[0]['PERC_PIS'].to_f
  expect(@response['cofinsBase']).to eq @taxes_aliquot[0]['BASE_COFINS'].to_f
  expect(@response['cofinsValue']).to eq @taxes_aliquot[0]['VL_COFINS'].to_f
  expect(@response['cofinsAliquot']).to eq @taxes_aliquot[0]['PERC_COFINS'].to_f
end

Given(/^I consult a taxes in cte API with price invalid$/) do
  @response = CteServices.new.get_cte_taxes("99,99")
end

Then(/^I should see the response error "([^"]*)"$/) do |msg|
  expect(@response['message']).to eq msg
end

Given(/^I consult a taxes in cte API with price user invalid$/) do
  @price = Faker::Number.decimal(3,2)
  @response = CteServices.new.get_cte_taxes_user_invalido(@price)
end

Given(/^I consult a taxes in cte API with price parameter invalid$/) do
  @response = CteServices.new.get_cte_taxes_parameter_invalido
end
