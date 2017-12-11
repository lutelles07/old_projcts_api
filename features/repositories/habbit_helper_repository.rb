class DirectSellingRepository

  def initialize
    @get_query = YAML::load(File.open('database_queries/habbit_helper.yml'))
  end

  def get_value_sapi_valor(sapi_api)
    query = @get_query['get_value_sapi_valor']
    query = query.gsub("<sapi_api>", sapi_api.to_s)
    get_sapi_valor = DatabaseService.new.execute_query(query)
    valuer = (get_sapi_valor[0]['SAPI_VALOR'].to_i - 1)
  end

  def update_lastid_directselling(sapi_api, value)
    query = @get_query["update_lastid_directselling"]
    query = query.gsub("<sapi_api>", sapi_api.to_s)
    query = query.gsub("<value>", value.to_s)
    updade_lastid = DatabaseService.new.execute_query_update(query)
  end

end
