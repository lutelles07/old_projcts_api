When(/^GET in Taxes passing a "([^"]*)" authentication$/) do |authentication|
  taxesContract = TaxesAPI.new(authentication)

  @response = taxesContract.get_all_taxes

  Debug.new.debug(@response)
end


And(/^Should show the default limit which is "([^"]*)"$/) do |limit|
  expect(JSON.parse(@response.body)["saleSkuTaxes"].size).to be limit.to_i
end


When(/^GET in Taxes\-details passing a "([^"]*)" authentication$/) do |authentication|

  response_hash = JSON.parse(@response.body)
  index = rand(0..((response_hash["saleSkuTaxes"].size)-1))


  taxesContract = TaxesAPI.new(authentication)

  details_path = @response["saleSkuTaxes"][index]["links"][0]["href"].split('/taxes/')

  idcia     = details_path[-1].split("/")[0]
  idfilial  = details_path[-1].split("/")[1]
  idsku     = details_path[-1].split("/")[2]

  @response = taxesContract.getDetails(idcia, idfilial, idsku)

  Debug.new.debug(@response)
end


When(/^GET in Taxes\-details with an invalid "([^"]*)" passing a "([^"]*)" authentication$/) do |invalidField, authentication|
  taxesContract = TaxesAPI.new(authentication)

  details_path = @response["saleSkuTaxes"][0]["links"][0]["href"].split('/taxes/')

  #Sending an invalid value
  case invalidField

    when "idcia"
      idcia = 99
      idfilial  = details_path[-1].split("/")[1]
      idsku     = details_path[-1].split("/")[2]

    when "idfilial"
      idcia     = details_path[-1].split("/")[0]
      idfilial = 99
      idsku     = details_path[-1].split("/")[2]

    when "idsku"
      idcia     = details_path[-1].split("/")[0]
      idfilial  = details_path[-1].split("/")[1]
      idsku = 999
  end

  @response = taxesContract.getDetails(idcia, idfilial, idsku)

  Debug.new.debug(@response)
end


When(/^GET in Taxes with limit equal "([^"]*)" passing a "([^"]*)" authentication$/) do |limit, authentication|
  taxesContract = TaxesAPI.new(authentication)

  @response = taxesContract.get_limit(limit)

  Debug.new.debug(@response)
end


When(/^GET in Taxes with lastid equal "([^"]*)" passing a "([^"]*)" authentication$/) do |lastid, authentication|
  #Store the first lineId in order to validate
  @first_lineId_response = @response["saleSkuTaxes"][0]["lineId"]

  taxesContract = TaxesAPI.new(authentication)

  @response = taxesContract.get_lastid(lastid)

  Debug.new.debug(@response)
end


When(/^GET in Taxes with lastid passing a "([^"]*)" authentication$/) do |authentication|

  #Call method to get the lastId
  @lastid = randomLastId

  taxesContract = TaxesAPI.new(authentication)
  @response = taxesContract.get_lastid(@lastid)

  Debug.new.debug(@response)
end


When(/^GET in Taxes with lastid linked to limit equal "([^"]*)" passing a "([^"]*)" authentication$/) do |limit, authentication|

  #Call method to get the lastId
  @lastid = randomLastId

  taxesContract = TaxesAPI.new(authentication)
  @response = taxesContract.get_lastid_and_limit(@lastid, limit)

  Debug.new.debug(@response)
end


def randomLastId
  response_hash = JSON.parse(@response.body)

  index = rand(0..((response_hash["saleSkuTaxes"].size)-1))

  #Get the lastid randomly
  lastid = @response["saleSkuTaxes"][index]["lineId"]

  return lastid
end


And(/^Validate the next lineId$/) do

  expect(@response["saleSkuTaxes"][0]["lineId"]).to be > @lastid
end


And(/^should show fully response$/) do

  expect((@response["saleSkuTaxes"][0]["lineId"]).to_i).to eq @first_lineId_response.to_i
end


When(/^GET in Taxes\-details of the first page passing a "([^"]*)" authentication$/) do |authentication|
  @response_resumida =  JSON.parse(@response.body)

  taxesContract = TaxesAPI.new(authentication)

  puts "########## This page has < #{(@response_resumida["saleSkuTaxes"].size)} > details ##########"

  #Search all occurs
  for i in 0..((@response_resumida["saleSkuTaxes"].size)-1)
    puts ">>>>>>># Details #{i+1}"

    details_path = @response_resumida["saleSkuTaxes"][i]["links"][0]["href"].split('/taxes/')

    idcia     = details_path[-1].split("/")[0]
    idfilial  = details_path[-1].split("/")[1]
    idsku     = details_path[-1].split("/")[2]

    @response = taxesContract.getDetails(idcia, idfilial, idsku)

    Debug.new.debug(@response)

   @response.code.to_s.should == '200'

  end

end


When(/^GET in Taxes\-details with "([^"]*)" pages passing a "([^"]*)" authentication$/) do |page, authentication|
  @response_resumida =  JSON.parse(@response.body)

  taxesContract = TaxesAPI.new(authentication)

  #Resumidas
  for j in 0..page.to_i

    puts '#------------------------------------------------------------------------------------------#'
    puts "#      ---> BEGINNING OF THE PAGE #{j+1}"
    puts '#------------------------------------------------------------------------------------------#'

    puts "########## This page has < #{(@response_resumida["saleSkuTaxes"].size)} > details ##########"

    #Search all detail pages
    for i in 0..((@response_resumida["saleSkuTaxes"].size)-1)
      puts ">>>>>>># Details #{i+1}"

      details_path = @response_resumida["saleSkuTaxes"][i]["links"][0]["href"].split('/taxes/')

      idcia     = details_path[-1].split("/")[0]
      idfilial  = details_path[-1].split("/")[1]
      idsku     = details_path[-1].split("/")[2]

      @response_detail = taxesContract.getDetails(idcia, idfilial, idsku)

      Debug.new.debug(@response_detail)

      @response_detail.code.to_s.should == '200'

      @lastid = @response_resumida["saleSkuTaxes"][i]["lineId"]

    end

        puts '#------------------------------------------------------------------------------------------#'
        puts "#      ---> ENDING OF THE PAGE - LastId #{@lastid}"
        puts '#------------------------------------------------------------------------------------------#'
    
        puts ">>>>>>>>>>>>>  Go to next PAGE"
        @response_resumida = taxesContract.get_lastid_and_limit(@lastid, 100)
        Debug.new.debug(@response_resumida)
        @response_resumida.code.to_s.should == '200'

  end


end