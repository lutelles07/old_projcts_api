When(/^I create a new mega route section in Aldebaran$/) do
  @json_section = CarriersSection.post_section_one
  @carriers_section = @response = CarriersSectionServices.new.create_section(@json_section)
  Debug.new.debug(@response)
end
When(/^I create two new mega route section in Aldebaran$/) do
  @json_section = CarriersSection.post_section_two
  @carriers_section = @response = CarriersSectionServices.new.create_section(@json_section)
  Debug.new.debug(@response)
end
When(/^I update an existing mega route section in Aldebaran$/) do
  @json_section = CarriersSection.update_section
  @carriers_section = @response = CarriersSectionServices.new.update_section(@json_section)
  Debug.new.debug(@response)
end

###############################################################################
                  #  NEGATIVE SCENARIOS  #
###############################################################################

When(/^I make a request without the sectionCode on the mega route section$/) do
  @json_section = CarriersSection.post_invalid_sectioncode
  @carriers_section = @response = CarriersSectionServices.new.create_section(@json_section)
  Debug.new.debug(@response)
end

When(/^I make a request without the name on the mega route section$/) do
  @json_section = CarriersSection.post_invalid_name
  @carriers_section = @response = CarriersSectionServices.new.create_section(@json_section)
  Debug.new.debug(@response)
end

When(/^I update an request without the name on the mega route section$/) do
  @json_section = CarriersSection.update_section_invalid
  @carriers_section = @response = CarriersSectionServices.new.update_section(@json_section)
  Debug.new.debug(@response)
end

When(/^I make an unauthorized request mega route section in Aldebaran$/) do
  @json_section = CarriersSection.post_section_one
  @carriers_section = @response = CarriersSectionServices.new.create_section_unauthorized(@json_section)
end

When(/^I make update an unauthorized request mega route section in Aldebaran$/) do
  @json_section = CarriersSection.update_section
  @carriers_section = @response = CarriersSectionServices.new.update_section_unauthorrized(@json_section)
  Debug.new.debug(@response)
end

When(/^I make an not supported Service GET mega route section in Aldebaran$/) do
  @carriers_section = @response = CarriersSectionServices.new.get_section
  Debug.new.debug(@response)
end

When(/^I request duplicate information on the mega route section$/) do
  @json_section = CarriersSection.post_section_duplicate
  @carriers_section = @response = CarriersSectionServices.new.create_section(@json_section)
  Debug.new.debug(@response)
end

When(/^I request for information with a number of characters above the allowed in the mega route section$/) do
  @json_section = CarriersSection.post_section_charecters_allowed_above
  @carriers_section = @response = CarriersSectionServices.new.create_section(@json_section)
  Debug.new.debug(@response)
end
