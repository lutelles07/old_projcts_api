class B2BPartnersRepository

    def initialize
        @b2bpartners_queries = YAML::load(File.open('database_queries/b2bpartners.yml'))
    end

    def get_b2bpartner_id
        query = @b2bpartners_queries["get_b2bpartner_id"]
        b2bpartner_id_list  = DatabaseService.new.execute_query(query)
        b2b_partners_id = b2bpartner_id_list[Random.new.rand(b2bpartner_id_list.size)]["CLIE_ID_TERCEIRO"]
        return b2b_partners_id
    end

    def get_details(idcliente)
        query = @b2bpartners_queries["get_details"]
        query = query.gsub("<idcli>", idcliente.to_s)
        b2bpartner_details  = DatabaseService.new.execute_query(query)
        return b2bpartner_details
    end

    def get_b2bpartner_invoice_list
        query = @b2bpartners_queries["get_invoices_details"]
        get_b2bpartner_id_list  = DatabaseService.new.execute_query(query)
        return get_b2bpartner_id_list
    end

    def get_max_noteID
        query = @b2bpartners_queries["get_max_notes"]
        get_max_notes  = DatabaseService.new.execute_query(query)
        return get_max_notes
    end

    def delete_invoices_header
        query = @b2bpartners_queries["delete_invoices_header"]
        DatabaseService.new.execute_query_delete(query)
    end

    def delete_invoices_details
        query = @b2bpartners_queries["delete_invoices_details"]
        DatabaseService.new.execute_query_delete(query)
    end

    def delete_invoices_b2bpartners
      query = @b2bpartners_queries["delete_invoices_b2bpartners"]
      DatabaseService.new.execute_query_delete(query)
    end

end
