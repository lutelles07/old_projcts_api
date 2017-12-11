class TipplerRepository

  def initialize
      @tippler_queries = YAML::load(File.open('database_queries/tippler.yml'))
  end

  def get_tippler_data(tipo_arquivo)
    query = @tippler_queries["get_id_tippler"]
    query = query.gsub("<tipo_arquivo>", tipo_arquivo.to_s )
    tippler_data = DatabaseService.new.execute_query(query)
    return tippler_data
  end

  def update_flag_leitura(id)
    query = @tippler_queries["update_flag_leitura"]
    query = query.gsub("<id>", id.to_s)
    updade_flag = DatabaseService.new.execute_query_update(query)
    return updade_flag
  end

end
