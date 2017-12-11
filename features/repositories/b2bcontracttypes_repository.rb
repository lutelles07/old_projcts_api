class B2BContractTypesRepository

    def initialize
        @b2bcontracttypes_queries = YAML::load(File.open('database_queries/b2bcontracttypes.yml'))
    end

    def get_billing_types_list
        query = @b2bcontracttypes_queries["get_billing_types"]
        get_billing_types_list  = DatabaseService.new.execute_query(query)
        return get_billing_types_list
    end

    def get_shipping_categories
        query = @b2bcontracttypes_queries["get_shipping_categories"]
        get_shipping_categories_list  = DatabaseService.new.execute_query(query)
        return get_shipping_categories_list
    end

    def get_payment_methods
        query = @b2bcontracttypes_queries["get_payment_methods"]
        get_payment_methods_list  = DatabaseService.new.execute_query(query)
        return get_payment_methods_list
    end

    def get_sales_channels
        query = @b2bcontracttypes_queries["get_sales_channels"]
        get_sales_channels_list  = DatabaseService.new.execute_query(query)
        return get_sales_channels_list
    end

end
