Given(/^GET B2BPartners invoice ID from database$/) do
  b2b_partners_repository = B2BPartnersRepository.new

  @b2b_partners_list_invoices = b2b_partners_repository.get_b2bpartner_invoice_list

  @b2b_max_notes = b2b_partners_repository.get_max_noteID[0]["MAX_NOTE_ID"].to_i
end


When(/^Format the invoice body with "([^"]*)" invoice\(s\)$/) do |quantity_invoices|

  #--> Create an Unique key to insert into DB
   @b2b_max_notes = @b2b_max_notes + 1

  #--> Format the body according to the number of Invoices
   if quantity_invoices.to_i == 1
    format_one_invoice
    @body_hash = CreateB2bpartners_Invoices.create_one_invoice(@random_invoice, @b2b_max_notes)

   elsif quantity_invoices.to_i == 2
     format_two_invoices
     @body_hash = CreateB2bpartners_Invoices.create_two_invoices(@hash_sorted_by_key, @b2b_max_notes)

   else

    expect(quantity_invoices.to_i).to be <= 2

   end
end


#Method to create ONE invoice
def format_one_invoice
  index = rand(0..(@b2b_partners_list_invoices.length-1))

  @documentID     = @b2b_partners_list_invoices[index]["PEDC_ID_CLIENTE"]
  @random_invoice = @b2b_partners_list_invoices[index]
end


#Method to create TWO invoices
def format_two_invoices
  @hash_sorted_by_key = []

  #--> Search the list (2) invoices regarding the same documentID that is why the list has been sorted by @documentID
  while @hash_sorted_by_key.length < 2

    #Get a document randomly
    index = rand(0..(@b2b_partners_list_invoices.length-1))
    @documentID = @b2b_partners_list_invoices[index]["PEDC_ID_CLIENTE"]

    #--> Select the hash by chosen document
    @hash_sorted_by_key = @b2b_partners_list_invoices.select { |h| h['PEDC_ID_CLIENTE'] == @documentID }

  end

end


When(/^POST in B2BPartners\-invoices passing a "([^"]*)" authentication$/) do | authentication|
  b2bpartnersContract = B2BpartnersAPI.new(authentication)

  #Passing ID from database
  @response = b2bpartnersContract.post_invoice(@documentID, @body_hash)

  Debug.new.debug(@response)
end


And(/^compare b2bpartners\-invoices with database$/) do

  #HEADER
  expect(@response['partnerId']).to eq @documentID
  expect(@response['debitNoteId']).to eq @body_hash['debitNoteId']
  expect(@response['totalValue'].to_f).to eq @body_hash['totalValue']

  #--> Sort array by "invoiceNumber" (Body)
  @hash_sorted = Utils.new.sort_array(@body_hash["invoices"], "invoiceNumber")

  #--> Sort array by "invoiceNumber" (Response)
  @response_sorted = Utils.new.sort_array(@response["invoices"], "invoiceNumber")


  #DETAILS (invoices) - Compare body with response
  for i in 0..((@response['invoices'].size)-1)

    expect(@response_sorted[i]['branchId']).to eq @hash_sorted[i]['branchId']
    expect(@response_sorted[i]['invoiceNumber']).to eq @hash_sorted[i]['invoiceNumber']
    expect(@response_sorted[i]['serie']).to eq @hash_sorted[i]['serie']
    expect(@response_sorted[i]['value'].to_f).to eq @hash_sorted[i]['value']
    expect(@response_sorted[i]['operationType']).to eq @hash_sorted[i]['operationType']

  end

end


When(/^Generating a incompatible CNPJ$/) do
  @documentID = Faker::CNPJ.numeric
end


When(/^Entering the field "([^"]*)" equal "([^"]*)"$/) do |field, value|

  case field.to_s

    when  "debitNoteId"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_debitNoted(@body_hash, value)

    when  "totalValue"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_totalValue(@body_hash, value)

    when  "invoicesAmount"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_invoicesAmount(@body_hash, value)

    when  "issueDate"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_issueDate(@body_hash, value)

    when  "dueDate"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_dueDate(@body_hash, value)

    when  "branchId"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_branchId(@body_hash, value)

    when  "invoiceNumber"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_invoiceNumber(@body_hash, value)

    when  "serie"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_serie(@body_hash, value)

    when  "value"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_value(@body_hash, value)

    when  "operationType"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_operationType(@body_hash, value)

    when  "instanceId"
          @body_hash_formatted = CreateB2bpartners_Invoices.input_instanceId(@body_hash, value)

  end

  @body_hash = @body_hash_formatted

end


And(/^Should see returnId equal "([^"]*)" with message "([^"]*)"$/) do |returnId, message|

  #DETAIL (invoices) - Validate returnId and message
  for i in 0..((@response['invoices'].size)-1)

    expect(@response['invoices'][i]['returnId'].include? returnId).to be true
    expect(@response['invoices'][i]['message'].include? message).to be true

  end

end
