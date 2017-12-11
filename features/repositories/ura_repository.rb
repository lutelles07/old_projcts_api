class Aldebaran_Ura

  def initialize
    @ura_queries = YAML::load(File.open('database_queries/ura.yml'))
  end

  def get_cpf_order_list
    query = @ura_queries["get_order_id_client_cpf"]
    get_cpf_order_list  = DatabaseService.new.execute_query(query)
  end

  def atualizar_items
    update = @ura_queries["update_date_order"]
    updade_date_order = DatabaseService.new.execute_query_update(update)

  end

end
