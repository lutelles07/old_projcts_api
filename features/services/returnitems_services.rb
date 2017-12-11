class ReturnItemService

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'ReturnItem - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end
  #==================================================================================================
  # RETUNN ITEMS API
  #==================================================================================================

  def get_returnitems
    self.class.get("/aldebaran-returnitems/returnitems/#{$id}", :basic_auth => @auth)
  end

  def get_returnitems_parameter_invalid
    self.class.get("/aldebaran-returnitems/returnitems/aaaaaa", :basic_auth => @auth)
  end

  def get_returnitems_authentication_invalid
    self.class.get("/aldebaran-returnitems/returnitems/#{$id}", :basic_auth => @auth)
  end

  def get_an_item_that_does_not_exist
    self.class.get("/aldebaran-returnitems/returnitems/1999999999", :basic_auth => @auth)
  end

  def put_targetWarranty(etiq_rg, body)
    self.class.put("/aldebaran-returnitems/returnitems/#{etiq_rg}/warranties", :basic_auth => @auth, :body => body.to_json)
  end

  def put_an_item_that_does_not_exist(body)
    self.class.put("/aldebaran-returnitems/returnitems/9999999999/warranties", :basic_auth => @auth, :body => body.to_json)
  end

end
