class InvoiceRepository

    def initialize
        @invoice_queries = YAML::load(File.open('database_queries/invoices.yml'))
    end

    def get_invoice_list
        query = @invoice_queries["get_invoice"]
        get_invoice_list  = DatabaseService.new.execute_query(query)
        get_invoice_list
    end

end
