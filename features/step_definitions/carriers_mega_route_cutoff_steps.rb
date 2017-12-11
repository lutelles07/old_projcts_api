When(/^I create a new mega route cutoffs in Aldebaran$/) do
  @json_cutoff = MegaRoutCutOff.post_new_cutoffs
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  Debug.new.debug(@response)
end

When(/^I Update an existing mega route cutoffs in Aldebaran$/) do
  @json_cutoff = MegaRoutCutOff.post_new_cutoffs
  @response_create_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  expect(@response_create_cutoff.code).to eq 201
  cutoffs = @response_create_cutoff.request.last_uri.to_s.split('/')
  @json_cutoff = MegaRoutCutOff.put_cutoffs
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.update_mega_route_cutoff(cutoffs[5], cutoffs[7], @json_cutoff)
  Debug.new.debug(@response)
end

When(/^I Delete an existing mega route cutoffs in Aldebaran$/) do
  @json_cutoff = MegaRoutCutOff.post_new_cutoffs
  @response_create_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  expect(@response_create_cutoff.code).to eq 201
  cutoffs = @response_create_cutoff.request.last_uri.to_s.split('/')
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.delete_mega_route_cutoff(cutoffs[5], cutoffs[7])
  Debug.new.debug(@response)
end

When(/^I make a request without the operationSection on the mega route cutoffs$/) do
  @json_cutoff = MegaRoutCutOff.post_cutoffs_without_operationsection
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  Debug.new.debug(@response)
end

When(/^I make a request without the carrierSection on the mega route cutoffs$/) do
  @json_cutoff = MegaRoutCutOff.post_cutoffs_without_carriersection
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  Debug.new.debug(@response)
end

When(/^I make a request without the user on the mega route cutoffs$/) do
  @json_cutoff = MegaRoutCutOff.post_cutoffs_without_user
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  Debug.new.debug(@response)
end

When(/^I make a request without the dateTime on the mega route cutoffs$/) do
  @json_cutoff = MegaRoutCutOff.post_cutoffs_without_datetime
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  Debug.new.debug(@response)
end

When(/^I make a request invalid the dateTime on the mega route cutoffs$/) do
  @json_cutoff = MegaRoutCutOff.post_cutoffs_invalid_datetime
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  Debug.new.debug(@response)
end

When(/^I make an unauthorized request mega route cutoffs in Aldebaran$/) do
  @json_cutoff = MegaRoutCutOff.post_new_cutoffs
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff_unauthorized(@json_cutoff)
  Debug.new.debug(@response)
end

When(/^I make an not supported Service GET mega route cutoffs in Aldebaran$/) do
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.get_mega_route_cutoff
  Debug.new.debug(@response)
end

When(/^I make a request with an invalid value in the operationsection at the mega route cutoffs$/) do
  @json_cutoff = MegaRoutCutOff.post_cutoffs_invaid_value_operationsection
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  Debug.new.debug(@response)
end

When(/^I make a request with an invalid value in the carriersection at the mega route cutoffs$/) do
  @json_cutoff = MegaRoutCutOff.post_cutoffs_invaid_value_carriersection
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  Debug.new.debug(@response)
end

When(/^I make a request with an invalid value in the user at the mega route cutoffs$/) do
  @json_cutoff = MegaRoutCutOff.post_cutoffs_invaid_value_user
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  Debug.new.debug(@response)
end

When(/^I make a request with an invalid value in the datetime at the mega route cutoffs$/) do
  @json_cutoff = MegaRoutCutOff.post_cutoffs_invaid_value_datetime
  @response = @response_cutoff = CarriesMegaRouteCutoffServices.new.create_mega_route_cutoff(@json_cutoff)
  Debug.new.debug(@response)
end
