class TaxesAPI

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'TAXES - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end

  #==================================================================================================
  # CONTRACT API
  #==================================================================================================

  def get_all_taxes
    self.class.get("/aldebaran-taxes/v2/taxes", :basic_auth => @auth)
  end


  def getDetails(idcia, idfilial, idsku)
    self.class.get("/aldebaran-taxes/v2/taxes/#{idcia}/#{idfilial}/#{idsku}", :basic_auth => @auth)
  end


  def get_limit(limit)
    self.class.get("/aldebaran-taxes/v2/taxes?limit=#{limit}", :basic_auth => @auth)
  end


  def get_lastid(lastid)
    self.class.get("/aldebaran-taxes/v2/taxes?lastId=#{lastid}", :basic_auth => @auth)
  end


  def get_lastid_and_limit(lastid,limit)
    self.class.get("/aldebaran-taxes/v2/taxes?lastId=#{lastid}&limit=#{limit}", :basic_auth => @auth)
  end

end
