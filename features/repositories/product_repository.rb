class ProductRepository

    def initialize
        @products_queries = YAML::load(File.open('database_queries/products.yml'))
    end

    def get_main_supplier
        query = @products_queries["get_main_supplier"]
        query = query.gsub("<sku-id>", $id.to_s)
        main_supplier = DatabaseService.new.execute_query(query)
        @main_supplier = main_supplier[0]["ITEG_ID_FORNEC"].to_s
    end

    def get_main_supplier_data(sku_id)
        query = @products_queries["get_main_supplier_data"]
        query = query.gsub("<sku-id>", sku_id.to_s)
        @main_supplier_data = DatabaseService.new.execute_query(query)
    end

    def get_sku_from_database
        query = @products_queries["get_sku"]
        sku_list = DatabaseService.new.execute_query(query)
        id = sku_list[Random.new.rand(sku_list.size)]["ITEG_ID"]
    end

    def get_product_by_sku(sku_id)
        query = @products_queries["get_product_by_sku"]
        query = query.gsub("<sku-id>",sku_id.to_s)
        product_data = DatabaseService.new.execute_query(query)

        if product_data[0]["ITEG_PZ_MESES_FABR"] == nil
            product_data[0]["ITEG_PZ_MESES_FABR"] = 0
        end
        product_data[0]
    end

    def get_ean_list_by_sku(sku_id)
        query = @products_queries["get_ean_list_by_sku"]
        query = query.gsub("<sku-id>",sku_id.to_s)
        ean_list = DatabaseService.new.execute_query(query)
    end

    def get_ean
        query = @products_queries["get_ean_list"]
        ean_list = DatabaseService.new.execute_query(query)
        ean_list[Random.new.rand(ean_list.size)]["EAN_ID_EAN"]
    end

    def get_manufacturer(sku_id)
        query = @products_queries["get_manufacturer"]
        query = query.gsub("<sku-id>",sku_id.to_s)
        manufacturer = DatabaseService.new.execute_query(query)
    end

     def get_deparments(sku_id)
        department_list = []
        query = @products_queries["get_departments"]
        query = query.gsub("<sku-id>",sku_id.to_s)
        department_list = DatabaseService.new.execute_query(query)
    end

    def get_sub_department(sku_id)
        query = @products_queries["get_subdepartment_item_geral"]
        query = query.gsub("<sku_id>",sku_id.to_s)
        sub_department = DatabaseService.new.execute_query(query)

        query = @products_queries["get_subdepartment_setor"]
        query = query.gsub("<department_id>",sub_department[0]["DEPARTMENT_ID"].to_s)
        query = query.gsub("<setor_id>",sub_department[0]["SETOR_ID"].to_s)

        sub_department_hash = DatabaseService.new.execute_query(query)
        sub_department_hash[0]
    end

    def get_cnpj_suppliers(sku_id)
        sellers_list = []
        query = @products_queries["get_cnpj_suppliers"]
        query = query.gsub("<sku_id>",sku_id.to_s)
        sellers_list = DatabaseService.new.execute_query(query)
    end

end
