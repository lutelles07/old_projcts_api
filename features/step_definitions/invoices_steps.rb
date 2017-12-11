Given(/^GET Invoices Id from database$/) do
  invoice_list = InvoiceRepository.new.get_invoice_list
  @invoice = invoice_list[Random.new.rand(invoice_list.size)]
end


When(/^GET in Invoices passing a "([^"]*)" authentication$/) do |authentication|
  invoicesContract = InvoicesAPI.new(authentication)

  #Passing ID from database
  idcia = @invoice["ID_CIA"]
  idbranch = @invoice["ID_FILIAL"]
  idnf = @invoice["NUMERO_NF"]
  idserie = @invoice["SERIE_NF"]

  @response = invoicesContract.get(idcia, idbranch, idnf, idserie)

  Debug.new.debug(@response)
end


And(/^Compare Invoices service response with database$/) do
  @response["company"].should == @invoice["ID_CIA"]
  @response["branch"].should == @invoice["ID_FILIAL"]
  @response["invoice"].should == @invoice["NUMERO_NF"]
  @response["serie"].should == @invoice["SERIE_NF"]
  @response["observations"].should == @invoice["OBS_NF"]

  Utils.new.assertEqualDates(@response['issueDate'],@invoice['DT_EMISSAO'].to_s)
end


When(/^GET in Invoices by the field companyid equal "([^"]*)", branchid equal "([^"]*)", invoiceid equal "([^"]*)", serieid equal "([^"]*)" passing a "([^"]*)" authentication$/) do |companyid, branchid, invoiceid, serieid, authentication|
  invoicesContract = InvoicesAPI.new(authentication)

  @response = invoicesContract.get(companyid, branchid, invoiceid, serieid)

  Debug.new.debug(@response)

end