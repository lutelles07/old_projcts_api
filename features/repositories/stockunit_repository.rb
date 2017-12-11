class StockUnitRepository

    def initialize
        @stockunit_queries = YAML::load(File.open('database_queries/stockunit.yml'))
    end

    def get_list_stockunit
        query = @stockunit_queries["get_from_list_stockunit"]
        get_icob_ai_client  = DatabaseService.new.execute_query(query)
    end


    def get_stockunit_data(id)
      query = @stockunit_queries["get_stockunit_data"]
      query = query.gsub("<id>", id.to_s )
      stockunit_data = DatabaseService.new.execute_query(query)
    end

end
