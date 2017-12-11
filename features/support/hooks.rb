Around('@run_10_times') do |_scenario, block|
    @total_of_tests_to_run = 10
    run_aldebaran_test(block)
end

Around('@run_20_times') do |_scenario, block|
    @total_of_tests_to_run = 20
    run_aldebaran_test(block)
end

Around('@run_50_times') do |_scenario, block|
    @total_of_tests_to_run = 50
    run_aldebaran_test(block)
end

def run_aldebaran_test(block)
  for test_number in (1..@total_of_tests_to_run)
      block.call
      Debug.new.debug_msg('###################################################################')
      Debug.new.debug_msg("########  Test Number: #{test_number} of #{@total_of_tests_to_run} ########")
      Debug.new.debug_msg('###################################################################')
  end
end

Before('@get_id_client') do
  @contracts = B2BContracts.new.get_icob_id_client
  index = rand(0..(@contracts.length-1))
  $id_client = @contracts[index]["ICOB_ID_CLIENTE"]
end

Before('@list_stockunit') do
  @list_stockunit = StockUnitRepository.new.get_list_stockunit
  index = rand(0..(@list_stockunit.length-1))
  $id_stockunit = @list_stockunit[index]["ID"]
  $ean = @list_stockunit[index]["EAN"]
  $plant = @list_stockunit[index]["PLANT"]
  $warranty = @list_stockunit[index]["WARRANTYID"]
  $inventorylocation_id = @list_stockunit[index]['INVENTORYLOCATIONID']
  $stockunit = @list_stockunit
end

After('@debug') do
  Debug.new.debug(@response)
end

Before('@delete_invoices') do
  B2BPartnersRepository.new.delete_invoices_details
  B2BPartnersRepository.new.delete_invoices_header
end

Before('@list_order_cpf') do
  @list = Aldebaran_Ura.new.get_cpf_order_list
  index = rand(0..(@list.length-1))
  $cpf_id = @list[index]["CPF_CNPJ"]
  $order_id = @list[index]["PED_LOJA"]
end

Before('@deleteZipcodes') do
  Aldebaran_Carriers.new.delete_zipcodes
end

Before('@del_b2bpartners') do
  @del = B2BPartnersRepository.new.delete_invoices_b2bpartners
end
