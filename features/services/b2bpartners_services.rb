class B2BpartnersAPI

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'B2BPARTNERS - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end

  #==================================================================================================
  # CONTRACT API
  #==================================================================================================

  def get_by_id(id)
    self.class.get("/aldebaran-b2bpartners/b2bpartners/#{id}", :basic_auth => @auth)
  end

  def get_cnpj
    self.class.get("/aldebaran-b2bpartners/b2bpartners/cnpjlist", :basic_auth => @auth)
  end

  def post_b2bpartnes(body)
    self.class.post("/aldebaran-b2bpartners/b2bpartners", :basic_auth => @auth, :body => body.to_json)
  end

  def put_b2bpartnes(body)
    self.class.put("/aldebaran-b2bpartners/b2bpartners", :basic_auth => @auth, :body => body.to_json)
  end

  def post_invoice(document, body)
    self.class.post("/aldebaran-b2bpartners/b2bpartners/#{document}/invoices", :basic_auth => @auth, :body => body.to_json)
  end

end
