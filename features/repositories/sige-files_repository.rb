class SigeFilesRepository

    def initialize
        @sige_files_queries = YAML::load(File.open('database_queries/sige-files.yml'))
    end

    def sige_arquivo_txt_cab_insert(id)
        query = @sige_files_queries["sige_arquivo_txt_cab_insert"]
        query = query.gsub("<sige_file_id>", id.to_s)
        DatabaseService.new.execute_query_insert(query)
    end

    def sige_arquivo_txt_det_insert(id, lines, file_content)
        query = @sige_files_queries["sige_arquivo_txt_det_insert"]
        file_content.each_index do |index|
                 insert_line = query.gsub("<sige_file_id>", id.to_s).gsub("<file_line>", (index+1).to_s).gsub("<file_line_content>", file_content[index].to_s)
                 DatabaseService.new.execute_query_insert(insert_line)
        end
    end

    def sige_arquivo_txt_cab_select(id)
        query = @sige_files_queries["sige_arquivo_txt_cab_select"]
        query = query.gsub("<id>", id.to_s)
        DatabaseService.new.execute_query(query)
    end

    def sige_arquivo_txt_det_select(id)
        query = @sige_files_queries["sige_arquivo_txt_det_select"]
        query = query.gsub("<id>", id.to_s)
        DatabaseService.new.execute_query(query)
    end

    def sige_check_flag_leitura(id)
      query = @sige_files_queries["sige_check_flag_leitura"]
      query = query.gsub("<id>", id.to_s)
      DatabaseService.new.execute_query(query)
    end

    def sige_arquivo_txt_cab_delete(id)
        query = @sige_files_queries["sige_arquivo_txt_cab_delete"]
        query = query.gsub("<id>", id.to_s)
        DatabaseService.new.execute_query_insert(query)
    end

    def sige_arquivo_txt_det_delete(id)
        query = @sige_files_queries["sige_arquivo_txt_det_delete"]
        query = query.gsub("<id>", id.to_s)
        DatabaseService.new.execute_query_insert(query)
    end

    def sige_arquivo_txt_cab_update_type(id, sige_file_type)
        query = @sige_files_queries["sige_arquivo_txt_cab_update_type"]
        query = query.gsub("<id>",id.to_s)
        query = query.gsub("<sige_file_type>",sige_file_type)
        DatabaseService.new.execute_query_insert(query)
    end

    def sige_arquivo_txt_cab_update(field, value, id)
        query = @sige_files_queries["sige_arquivo_txt_cab_update"]
        query = query.gsub("<sige_file_field>",field)
        query = query.gsub("<sige_file_value>",value)
        query = query.gsub("<id>",id.to_s)

        DatabaseService.new.execute_query_insert(query)
    end

    def get_max_sige_file_id
        query = @sige_files_queries["get_max_sige_file_id"]
        DatabaseService.new.execute_query(query)
    end

end
