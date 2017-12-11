Given(/^GET in GoodsReceivedNotes Id from database$/) do
  date_list = GoodsReceivedNotesRepository.new.get_dates_available
  date = Utils.new.get_random_value_from_list(date_list)

  @start_date = "#{date["DT_EMISSAO"]} 00:00:01"
  @end_date =   "#{date["DT_EMISSAO"]} 23:59:59"
  # @start_date="29/09/2016 00:00:01"
  # @end_date="29/09/2016 23:59:59"

  # @start_date="19/04/2016 00:00:01"
  # @end_date="19/04/2016 23:59:59"

  # @start_date="30/11/2016 00:00:01"
  # @end_date="30/11/2016 23:59:59"

  @goods_received_notes = GoodsReceivedNotesRepository.new.get_goods_received_notes_for_one_day(@start_date, @end_date)
end


When(/^GET in Goodsreceivednotes by Dates passing a "([^"]*)" authentication$/) do |authentication|
  goodreceivednotesContract = GoodsReceivedNotesAPI.new(authentication)

  startdate = get_date_query_string_format(@start_date)
  enddate = get_date_query_string_format(@end_date)

  #Passing IDs from database
  @response = goodreceivednotesContract.get_by_startDate_endDate(startdate, enddate)
end


def get_date_query_string_format(date_to_format)
  if date_to_format != nil && !date_to_format.gsub(" ","").empty?
    date_elements = date_to_format.split("/")
    date_elements << date_elements[2].split(" ")
    "#{date_elements[3][0]}-#{date_elements[1]}-#{date_elements[0]}T#{date_elements[3][1]}"
  end
end


def format_date_database(date_to_format)
  if date_to_format != nil && !date_to_format.gsub(" ","").empty?
    date_elements = date_to_format.split("/")
    date_elements << date_elements[2].split(" ")
    "#{date_elements[3][0]}-#{date_elements[1]}-#{date_elements[0]}"
  end
end


When(/^GET in Goodsreceivednotes by the field STARTDATE equal "([^"]*)" with the field ENDDATE equal "([^"]*)" passing a "([^"]*)" authentication$/) do |startdate, enddate, authentication|
  goodreceivednotesContract = GoodsReceivedNotesAPI.new(authentication)
  #@response = goodreceivednotesContract.get_by_startDate_endDate(startdate, enddate)

  if ((startdate == "empty") && (enddate == "empty"))
      @response = goodreceivednotesContract.get_without_dates
    elsif  (startdate == "empty")
            @response = goodreceivednotesContract.get_by_endDate(enddate)
      elsif  (enddate == "empty")
             @response = goodreceivednotesContract.get_by_startDate(startdate)
  else
    @response = goodreceivednotesContract.get_by_startDate_endDate(startdate, enddate)
  end
end
