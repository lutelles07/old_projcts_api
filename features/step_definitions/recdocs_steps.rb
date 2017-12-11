Given(/^GET RecDoc Id from database$/) do
  @id = RecDocsRepository.new.get_recdoc_id
  @recdocs = RecDocsRepository.new.get_recdoc_data_by_id(@id)
end

Given(/^RecDoc\-id is equal "([^"]*)"$/) do |recdocs_ID|
  @id = recdocs_ID
end

When(/^GET in RecDoc with X\-tid "([^"]*)" passing a "([^"]*)" authentication$/) do |xtid, authentication|
  @xtid = xtid

  recdocsContract = RecDocsAPI.new(authentication)
  @response = recdocsContract.get_xtid(xtid, @id)

  Debug.new.debug(@response)
end

When(/^GET in RecDocs by recdoc\-id passing a "([^"]*)" authentication$/) do |authentication|
  recdocsContract = RecDocsAPI.new(authentication)
  @response = recdocsContract.get(@id)

  Debug.new.debug(@response)
end

And(/^Compare RecDocs service response with database$/) do

  treat_recdocs_response_to_compare_database
  check_response_recdocs_fields

  @response["receiptNote"].each do |response_receipt_note|
    response_receipt_note["orders"].each do |response_receipt_note_order|
      response_receipt_note_order["orderItems"].each do |response_receipt_note_order_order_item|
        receipt_note_id = response_receipt_note["id"]
        order_id        = response_receipt_note_order["id"]
        order_item_id   = response_receipt_note_order_order_item["id"]
        item_id         = response_receipt_note_order_order_item["itemId"]
        quantity        = response_receipt_note_order_order_item["receivedQuantity"]
        recdoc_order_item_id = filter_order_item_id(receipt_note_id,order_id,order_item_id,item_id,quantity)
        check_response_recdocs_receiptnote_orders_items_fields(recdoc_order_item_id,response_receipt_note_order_order_item)
      end
    end
  end

end


def treat_recdocs_response_to_compare_database
  @recdocs.each_index do |index|
    @recdocs[index]["ORDERID"] = nil if @recdocs[index]["ORDERID"] == nil
    @recdocs[index]["ORDERITEMID"] = nil if @recdocs[index]["ORDERITEMID"] == nil
    @recdocs[index]["ITEMID"] = nil if @recdocs[index]["ITEMID"] == nil
  end
end


def treat_recdocs_response_to_compare_lockdown
  @response["receiptNote"][0]["orders"][0]["id"]
  @response = @response.to_json
  @response = @response.gsub("\"id\":0","\"id\":null")
  @response = @response.gsub("\"itemId\":0","\"itemId\":null")
  @response = JSON.parse(@response)
end


def filter_order_item_id(receipt_note_id,order_id,order_item_id,item_id,quantity)
  @recdocs.select{|item| item["RECEIPTNOTEID"] == receipt_note_id &&  item["ORDERID"] == order_id && item["ORDERITEMID"] == order_item_id && item["ITEMID"] == item_id && item["RECEIVEDQUANTITY"] == quantity}
end


def check_response_recdocs_fields
  @response["id"].should                    == @recdocs[0]["ID"]
  @response["distributionCenter"].should    == @recdocs[0]["DISTRIBUTIONCENTER"]
  @response["status"].should                == @recdocs[0]["STATUS"]
  @response["truck"]["driver"].should       == @recdocs[0]["DRIVER"]
  @response["truck"]["licensePlate"].should == @recdocs[0]["LICENSEPLATE"]
  @response["suppliers"][0].should          == @recdocs[0]["SUPPLIERS"]
end


def check_response_recdocs_receiptnote_orders_items_fields(recdoc_order_item_id,response_receipt_note_order_order_item)
  # puts "#{recdoc_order_item_id}"
  recdoc_order_item_id[0]["ORDERITEMID"].should == response_receipt_note_order_order_item["id"]
  recdoc_order_item_id[0]["INVOICENUMBER"].should == response_receipt_note_order_order_item["invoice"]["number"]
  recdoc_order_item_id[0]["INVOICESERIE"].should == response_receipt_note_order_order_item["invoice"]["serie"]
  recdoc_order_item_id[0]["RECEIVEDQUANTITY"].should == response_receipt_note_order_order_item["receivedQuantity"]
  recdoc_order_item_id[0]["ITEMID"].should == response_receipt_note_order_order_item["itemId"]
  recdoc_order_item_id[0]["REASON"].should == response_receipt_note_order_order_item["reason"]
end
