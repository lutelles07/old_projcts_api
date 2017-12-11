When(/^GET in Aldebaran-Tippler in new Aldebaran Server type REV$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_edis_rev
end

Then(/^Valid Aldebaran-Tippler Response body equal "([^"]*)"$/) do |msg|
  expect(@response.body.strip).to eq msg
end

When(/^GET in Aldebaran\-Tippler in new Aldebaran Server type REM$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_edis_rem
end

When(/^GET in Aldebaran\-Tippler in new Aldebaran Server type invoices REV$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_invoices_rev
end

When(/^GET in Aldebaran\-Tippler in new Aldebaran Server type invoices REM$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_invoice_rem
end

When(/^GET in Aldebaran\-Tippler in new Aldebaran Server type CHK$/) do
  @response = Aldebaran_Tippler_Service.new.fime_query_checklist
end

When(/^GET in Aldebaran Tipller with invalid user$/) do
  @response = Aldebaran_Tippler_Service.new.get_invalid_user
end

Then(/^I Valid if the response contains the field X\-tid$/) do
  expect(@response.headers["X-tid"].include?"Tippler").to eq true
end

Given(/^Get in Aldebaran Tipller with id invalid$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_edis_invalid
end

Given(/^Get in Aldebaran Tipller with not existent$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_edis_not_existent
end

When(/^GET in Aldebaran\-Tippler in new Aldebaran Server type CHK download alternative$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_chk_down_alternative
end

When(/^GET in Aldebaran\-Tippler in new Aldebaran Server type REM download alternative$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_rem_down_alternative
end

When(/^GET in Aldebaran\-Tippler in new Aldebaran Server type REV download alternative$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_rev_down_alternative
end

When(/^GET in Aldebaran\-Tippler in new Aldebaran Server type invoices REM download alternative$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_rem_invoice_down_alternative
end

When(/^GET in Aldebaran\-Tippler in new Aldebaran Server type invoices REV download alternative$/) do
  @response = Aldebaran_Tippler_Service.new.file_query_rev_invoice_down_alternative
end

Given(/^I acecss the rabbitmq to tippler "([^"]*)" for queue "([^"]*)"$/) do |tipo_arquivo, row_name|
  @id_tippler = TipplerRepository.new.get_tippler_data(tipo_arquivo) 
  @update_flag_leitura = TipplerRepository.new.update_flag_leitura(@id_tippler[0]['INFL_ID_SEQUENCIAL'].to_s)
  @connection_rabbtmq = AldebaranConectionRebbitMQ.new.connection_rabbtmq(row_name)
end

Then(/^I check response_tippler with json_schema "([^"]*)"$/) do |schema|
  json_schema =  "#{Dir.pwd}/features/support/json_schema/#{schema}"
  expect(JSON::Validator.validate!(json_schema, $body)).to eq true
end
