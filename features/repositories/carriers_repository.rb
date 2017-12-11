class Aldebaran_Carriers

  def initialize
    @carriers_queries = YAML::load(File.open('database_queries/carriers.yml'))
  end

  def get_cnpj_transp
    query = @carriers_queries["get_cnpj_transp"]
    get_cnpj_transp = DatabaseService.new.execute_query(query)
  end

  def get_section_id_corte
    query = @carriers_queries["get_section_code"]
    get_section_id_corte = DatabaseService.new.execute_query(query)
  end

  def get_cnpj_contracts
    query = @carriers_queries["get_terceiro_contract"]
    get_cnpj_terceiro = DatabaseService.new.execute_query(query)
  end

  def get_cnpj_contracts_transportadora
    query = @carriers_queries["get_transportadora_contract"]
    get_cnpj_transportadora = DatabaseService.new.execute_query(query)
  end

  def get_cnpj_contracts_cnpj
    query = @carriers_queries["get_transportadora_cnpj"]
    get_cnpj_transportadora = DatabaseService.new.execute_query(query)
    return get_cnpj_transportadora
  end

  def get_zipcodes
    query = @carriers_queries["get_zipcodes"]
    get_list_zipcode = DatabaseService.new.execute_query(query)
  end

  def count_zipcodes(cnpj, branch, contractid, region, cepini, cepfim)
    query = @carriers_queries["get_count_zipcodes"]
    query = query.gsub("<cnpj>", cnpj.to_s)
    query = query.gsub("<branch>", branch.to_s)
    query = query.gsub("<contractid>", contractid.to_s)
    query = query.gsub("<region>", region.to_s)
    query = query.gsub("<cepini>", cepini.to_s)
    query = query.gsub("<cepfim>", cepfim.to_s)
    count_lines = DatabaseService.new.execute_query(query)
  end

  def match_zipcodes(cnpj, branch, contractid, region, cepini, cepfim)
    query = @carriers_queries["match_zipcodes"]
    query = query.gsub("<cnpj>", cnpj.to_s)
    query = query.gsub("<branch>", branch.to_s)
    query = query.gsub("<contractid>", contractid.to_s)
    query = query.gsub("<region>", region.to_s)
    query = query.gsub("<cepini>", cepini.to_s)
    query = query.gsub("<cepfim>", cepfim.to_s)
    count_lines = DatabaseService.new.execute_query(query)
  end

  def delete_zipcodes
    query = @carriers_queries["delete_zipcodes"]
    DatabaseService.new.execute_query_delete(query)
  end

  def get_regions(cnpj, branch, contractid, region)
    query = @carriers_queries["get_regions"]
    query = query.gsub("<cnpj>", cnpj.to_s)
    query = query.gsub("<branch>", branch.to_s)
    query = query.gsub("<contractid>", contractid.to_s)
    query = query.gsub("<region>", region.to_s)
    return DatabaseService.new.execute_query(query)
  end

  def count_all_regions(cnpj, branch, contractid)
    query = @carriers_queries["count_all_regions"]
    query = query.gsub("<cnpj>", cnpj.to_s)
    query = query.gsub("<branch>", branch.to_s)
    query = query.gsub("<contractid>", contractid.to_s)
    return DatabaseService.new.execute_query(query)
  end

end
