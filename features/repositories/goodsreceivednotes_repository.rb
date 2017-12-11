class GoodsReceivedNotesRepository

    def initialize
        @goodsreceivednotes_queries = YAML::load(File.open('database_queries/goodsreceivednotes.yml'))
    end

    def get_dates_available
        query = @goodsreceivednotes_queries["get_goodsreceivednotes_date"]
        DatabaseService.new.execute_query(query)
    end

    def get_goods_received_notes_for_one_day(start_date, end_date)
        query = @goodsreceivednotes_queries["get_goodsreceivednote"]
        query = query.gsub("<start_date>",start_date)
        query = query.gsub("<end_date>"  ,end_date)
        query = query.gsub("<limit>"  ,"1000")
        DatabaseService.new.execute_query(query)
    end


end
