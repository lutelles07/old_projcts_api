class GoodsReceivedNotesAPI

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'GOODS RECEIVED NOTES - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end

  #==================================================================================================
  # CONTRACT API
  #==================================================================================================

  def get_by_startDate_endDate(startDate, endDate)
    self.class.get("/aldebaran-goodsreceivednotes/goodsreceivednotes/items?startDate=#{startDate}&endDate=#{endDate}", :basic_auth => @auth)
  end

  def get_without_dates
    self.class.get("/aldebaran-goodsreceivednotes/goodsreceivednotes/items", :basic_auth => @auth)
  end

  def get_by_startDate(startDate)
    self.class.get("/aldebaran-goodsreceivednotes/goodsreceivednotes/items?startDate=#{startDate}", :basic_auth => @auth)
  end


  def get_by_endDate(endDate)
    self.class.get("/aldebaran-goodsreceivednotes/goodsreceivednotes/items?endDate=#{endDate}", :basic_auth => @auth)
  end

end
