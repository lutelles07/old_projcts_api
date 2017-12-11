class InstanceRepository

    def initialize
        @instance_queries = YAML::load(File.open('database_queries/instance.yml'))
    end

    def get_instance_id
        instance_id_list = DatabaseService.new.execute_query(@instance_queries["get_instance_id"]  )
        @instance_id = instance_id_list[Random.new.rand(instance_id_list.size)]["INST_ID_INSTANCIA"].to_s
    end

    def get_instance_data_by_id(id)
        query = @instance_queries["get_instance_data"]
        query = query.gsub("<instance-id>",id)
        @instance_id_data = DatabaseService.new.execute_query(query)
    end

    def get_instance_data_by_variableID
        query = @instance_queries["get_variable_ID"]
        @instance_list_variables = DatabaseService.new.execute_query(query)
    end

    def get_instance_value(instanceID, variableID)
        query = @instance_queries["get_instance_value"]
        query = query.gsub("<instance-id>",instanceID)
        query = query.gsub("<variable-id>",variableID)
        @instance_desc = DatabaseService.new.execute_query(query)
    end
end
