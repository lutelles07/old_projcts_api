class B2BContracts

    def initialize
        @b2bcontracts_queries = YAML::load(File.open('database_queries/b2bcontracts.yml'))
    end

    def get_icob_id_client
        query = @b2bcontracts_queries["get_icob_id_client"]
        get_icob_ai_client  = DatabaseService.new.execute_query(query)
    end
end
