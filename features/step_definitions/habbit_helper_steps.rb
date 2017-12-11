Given(/^I acecss the rabbitmq the "([^"]*)" in get message fo queue "([^"]*)"$/) do |sapi_api, row_name|
  @value = DirectSellingRepository.new.get_value_sapi_valor(sapi_api)
  @update = DirectSellingRepository.new.update_lastid_directselling(sapi_api, @value)
  @connection_rabbtmq = AldebaranConectionRebbitMQ.new.connection_rabbtmq(row_name)
  puts $body
end

Then(/^I check response with json_schema "([^"]*)"$/) do |schema|
  json_schema =  "#{Dir.pwd}/features/support/json_schema/#{schema}"
  expect(JSON::Validator.validate!(json_schema, $body)).to eq true
end
