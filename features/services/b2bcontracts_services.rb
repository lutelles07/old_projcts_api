class B2bcontractsAPI

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'B2B CONTRACTS - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end

  #==================================================================================================
  # CONTRACT API
  #==================================================================================================

  def post(hashbody)
    self.class.post("/aldebaran-b2bcontracts/b2bcontracts", :basic_auth => @auth, :body => hashbody.to_json)
  end

  def put(hashbody)
    self.class.put("/aldebaran-b2bcontracts/b2bcontracts", :basic_auth => @auth, :body => hashbody.to_json)
  end

end
