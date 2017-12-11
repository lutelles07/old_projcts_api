class ReturnItemRepository

    def initialize
        @returnitems_queries = YAML::load(File.open('database_queries/returnitems.yml'))
    end

  def get_estoque_id_from_config
    $return_item.estoque_id = $estoque_id_list[$env][Random.new.rand($estoque_id_list[$env].size)].to_s
    $return_item.estoque_id = $return_item.complete_estoque_id_to_size_ten
    $id = $return_item.estoque_id
  end

  def get_estoque_id_from_database
     query = @returnitems_queries["get_return_item_id"]
     estoque_id_list = DatabaseService.new.execute_query(query)
     $id = estoque_id_list[Random.new.rand(estoque_id_list.size)]["ETIQ_RG"].gsub(" ","")
  end

  def get_estoque_list_from_database
     query = @returnitems_queries["get_return_item_id"]
     @test = DatabaseService.new.execute_query(query)
     return @test
  end
end
