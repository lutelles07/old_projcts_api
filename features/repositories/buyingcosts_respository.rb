class BuyingCostsRepository

    def initialize
        @buyingcosts_queries = YAML::load(File.open('database_queries/buyingcosts.yml'))
    end

    def get_buyingcosts_list
        query = @buyingcosts_queries["get_buyingcosts"]
        get_buyingcosts_list  = DatabaseService.new.execute_query(query)
        get_buyingcosts_list
    end

end
