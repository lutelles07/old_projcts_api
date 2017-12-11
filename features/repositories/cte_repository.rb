class CteRepository

    def initialize
        @cte_queries = YAML::load(File.open('database_queries/cte.yml'))
    end

    def get_cte_cfop(uf_origen, uf_destino, transfer)
        query = @cte_queries["get_cte_cfop"]
        query = query.gsub("<uf_origen>", uf_origen.to_s)
        query = query.gsub("<uf_destino>", uf_destino.to_s)
        query = query.gsub("<transfer>", transfer.to_s)
        cte_cfop = DatabaseService.new.execute_query(query)
    end

    def get_cte_taxes(price)
      query = @cte_queries["get_cte_taxes"]
      query = query.gsub("<price>", price.to_s)
      cte_taxes = DatabaseService.new.execute_query(query)
    end

end
