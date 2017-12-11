Given(/^GET Delivery Id from database$/) do
  @id = DeliveryRepository.new.get_delivery_id
  @delivery_data = DeliveryRepository.new.get_delivery_data_by_id(@id)
end


When(/^GET in Delivery by id passing a "([^"]*)" authentication$/) do |authentication|
  deliveyContract = DeliveriesAPI.new(authentication)

  #Passing ID from database
  @response = deliveyContract.get_by_id(@id)

  Debug.new.debug(@response)
end


When(/^GET in Delivery by the field delivery\-id equal "([^"]*)" passing a "([^"]*)" authentication$/) do |value, authentication|
  deliveyContract = DeliveriesAPI.new(authentication)
  @response = deliveyContract.get_by_id(value)

  Debug.new.debug(@response)
end


Then(/^Compare Delivery service response with database$/) do
  hash_diff = HashDiff.diff(@delivery_data[0],@response)
  if hash_diff.size > 0
    puts "#{@id}"
    puts "#{hash_diff}"
  end
  hash_diff.size.should == 0
end