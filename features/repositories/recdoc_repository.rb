class RecDocsRepository

    def initialize
        @recdocs_queries = YAML::load(File.open('database_queries/recdocs.yml'))
    end

    def get_recdoc_id
        recdocs_id_list = []
        query = @recdocs_queries["get_id"]
        recdocs_list = DatabaseService.new.execute_query(query)
        recdocs_list[Random.new.rand(recdocs_list.size)]["REDO_ID_RECDOC"]
    end

    def get_recdoc_data_by_id(id)
        recdocs_id_list = []
        query = @recdocs_queries["get_id_data"]
        query = query.gsub("<recdoc_id>", id.to_s)

        recdoc_data_list = DatabaseService.new.execute_query(query)
    end

end
