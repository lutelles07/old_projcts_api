Given(/^GET Instance Id from database$/) do
  @instance_repository = InstanceRepository.new
  @instance_id = @instance_repository.get_instance_id
  @instance_data = @instance_repository.get_instance_data_by_id(@instance_id)
end


When(/^GET in Instance by instance\-id passing a "([^"]*)" authentication$/) do |authentication|
  instanceContract = InstanceAPI.new(authentication)

  #Passing ID from database
  @response = instanceContract.get_by_id(@instance_id)

  Debug.new.debug(@response)
end


When(/^GET in Instance by the field instance\-id equal "([^"]*)" passing a "([^"]*)" authentication$/) do |value, authentication|
  instanceContract = InstanceAPI.new(authentication)
  @response = instanceContract.get_by_id(value)

  Debug.new.debug(@response)
end


And(/^Compare the responses with database$/) do
  @response['id'].should == @instance_data[0]['ID']
  date_time_response  = DateTime.parse(@response['createdDate'])
  date_time_database = DateTime.parse(@instance_data[0]['CREATEDDATE'].to_s)
  date_time_response.year.should == date_time_database.year
  date_time_response.month.should == date_time_database.month
  date_time_response.day.should == date_time_database.day

  @response['reason'].should == @instance_data[0]['REASON']
  @response['observations'].should == @instance_data[0]['OBSERVATIONS']
  @response['businessUnit']['id'].should == @instance_data[0]['BUSINESSUNIT_ID']
  @response['businessUnit']['name'].should == @instance_data[0]['BUSINESSUNIT_NAME']
end


Given(/^that the body has "([^"]*)" valid names which were acquired from database$/) do |countBody|
  @countList = countBody.to_i

  @list_variables = @instance_repository.get_instance_data_by_variableID
  @hashBody = Create_instances.create_instances(@list_variables, @countList)
end


When(/^POST in Instance by instance\-id passing a "([^"]*)" authentication$/) do |authentication|
  instanceContract = InstanceAPI.new(authentication)
  @response = instanceContract.post_by_id(@instance_id, @hashBody)

  Debug.new.debug(@response)
end


When(/^inputing an invalid name equal "([^"]*)"$/) do |nameValue|
  size = @hashBody["messageParameters"].length

  index = 0

  if  size > 1
      r = Random.new
      index = r.rand(0...size-1)
  end

  @hashBody["messageParameters"][index]["name"] = nameValue.to_s
end


When(/^inputting an invalid IDinstance equal "([^"]*)"$/) do |id_instance|
  @instance_id = id_instance.to_i
end

And(/^Validate post response with database$/) do

  #convert the body (json) to hash
  hashbody = JSON.parse(@response.body)


  #This block aims to validate each array position to ensure that all values are according to database values
  for i in 0..(hashbody["messageParameters"].length-1)

    #Access the database to get the value
    description = @instance_repository.get_instance_value(@instance_id,hashbody["messageParameters"][i]["name"])

    if (hashbody["messageParameters"][i]["name"] == description[0]["VALUE_DESCRIPTION"])
        hashbody["messageParameters"][i]["value"].should == nil
    else
        hashbody["messageParameters"][i]["value"].should == description[0]["VALUE_DESCRIPTION"]
    end
  end

end
