class CarriersAPI

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'CARRIERS - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end

  #==================================================================================================
  # CONTRACT API
  #==================================================================================================

  def post_carriers(document, body)
    self.class.post("/aldebaran-carriers/carriers/#{document}", :basic_auth => @auth, :body => body.to_json)
  end

  def post_carriers_contracts(document, body)
    self.class.post("/aldebaran-carriers/carriers/#{document}/contracts", :basic_auth => @auth, :body => body.to_json)
  end

  def put_carriers_contracts(document, branch, id, body)
    self.class.put("/aldebaran-carriers/carriers/#{document}/contracts/#{branch}/#{id}", :basic_auth => @auth, :body => body.to_json)
  end

end
