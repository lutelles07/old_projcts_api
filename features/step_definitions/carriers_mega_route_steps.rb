When(/^I create a new mega route in Aldebaran$/) do
  @json_mega_route = CarriersMegaRoute.create_mega_route
  @response_carriers = @response = AldebaranCarriesMegaRouteServices.new.create_mega_route(@json_mega_route)
  Debug.new.debug(@response)
end

Then(/^it will return code "([^"]*)"$/) do |code|
  expect(@response.code).to eq code.to_i
end

Then(/^I check if the response body contain the message "([^"]*)"$/) do |msg|
  expect(@response_carriers['message']).to eq msg
  expect(@response_carriers['id']).to eq (@json_mega_route['megaroutes'][0]['id'])
  Debug.new.debug(@response)
end

When(/^I Update an existing mega route in Aldebaran$/) do
  @json_mega_route = CarriersMegaRoute.updade_mega_route
  @response_carriers = @response = AldebaranCarriesMegaRouteServices.new.update_mega_route(@json_mega_route)
  Debug.new.debug(@response)
end

Then(/^I check if the response contain the message "([^"]*)"$/) do |msg|
expect(@response['message']).to eq msg
end

Then(/^I see the error message "([^"]*)"$/) do |msg|
  expect(@response['message']).to eq msg
end

When(/^I Delete an existing mega route in Aldebaran$/) do
  @json_mega_route = CarriersMegaRoute.create_mega_route
  @response_carriers_delete = AldebaranCarriesMegaRouteServices.new.create_mega_route(@json_mega_route)
  expect(@response_carriers_delete.code).to eq 201
  @response_carriers = @response = AldebaranCarriesMegaRouteServices.new.delete_mega_route(@response_carriers_delete['cnpj'], @response_carriers_delete['id'])
  Debug.new.debug(@response)
end

When(/^I make a request without the ID on the mega route$/) do
  @json_mega_route = CarriersMegaRoute.create_mega_route_invalid
  @response_carriers = @response = AldebaranCarriesMegaRouteServices.new.create_mega_route(@json_mega_route)
  Debug.new.debug(@response)
end

Then(/^I see the error code "([^"]*)"$/) do |msg|
  expect(@response['code']).to eq msg
end

When(/^I make an unauthorized request mega route in Aldebaran$/) do
  @json_mega_route = CarriersMegaRoute.create_mega_route
  @response_carriers = @response = AldebaranCarriesMegaRouteServices.new.mega_route_auth_invalid(@json_mega_route)
  Debug.new.debug(@response)
end

When(/^I make an not supported Service GET mega route in Aldebaran$/) do
  @json_mega_route = CarriersMegaRoute.create_mega_route
  @response_carriers = @response = AldebaranCarriesMegaRouteServices.new.mega_route_service_not_supported(@json_mega_route)
  Debug.new.debug(@response)
end

When(/^I make a request without the name on the mega route$/) do
  @json_mega_route = CarriersMegaRoute.mega_route_without_name
  @response_carriers = @response = AldebaranCarriesMegaRouteServices.new.create_mega_route(@json_mega_route)
  Debug.new.debug(@response)
end

When(/^I make a request without the externalDelivery on the mega route$/) do
  @json_mega_route = CarriersMegaRoute.mega_route_without_externalDelivery
  @response_carriers = @response = AldebaranCarriesMegaRouteServices.new.create_mega_route(@json_mega_route)
  Debug.new.debug(@response)
end

When(/^I make a request without the absenceRegion on the mega route$/) do
  @json_mega_route = CarriersMegaRoute.mega_route_without_absenceRegion
  @response_carriers = @response = AldebaranCarriesMegaRouteServices.new.create_mega_route(@json_mega_route)
  Debug.new.debug(@response)
end

When(/^I make a request without the sectionId on the mega route$/) do
  @json_mega_route = CarriersMegaRoute.mega_route_without_sectionId
  @response_carriers = @response = AldebaranCarriesMegaRouteServices.new.create_mega_route(@json_mega_route)
  Debug.new.debug(@response)
end
