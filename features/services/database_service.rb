 require 'yaml'

 class DatabaseService
     attr_reader :conn, :ROW_LIMIT, :SKU_LIMIT

    def initialize
        db = $database
        @conn = OCI8.new(db['username'],db['password'],db['database'])
        @ROW_LIMIT = 50
        @SKU_LIMIT = 5000
    end

    def get_db_connection
        @conn
    end

    def execute_query(query)
        id_list = []

        cursor = @conn.exec(query)
        while r = cursor.fetch_hash()
            id_list << r
        end
        cursor.close
        @conn.logoff

        id_list
    end

    def execute_query_insert(query)
        @conn.exec(query)
        @conn.commit
        @conn.logoff
    end

    def execute_query_delete(query)
       @conn.exec(query)
       @conn.commit
       @conn.logoff
    end

    def execute_query_update(query)
        cursor = @conn.parse(query)
        cursor.exec
        @conn.commit
        @conn.logoff
    end


 end
