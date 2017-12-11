class InvoicesAPI

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'INVOICES - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end

  #==================================================================================================
  # CONTRACT API
  #==================================================================================================

  def get(idcia, idbranch, idnf, idserie)
    self.class.get("/aldebaran-invoices/invoices/#{idcia}/#{idbranch}/#{idnf}/#{idserie}", :basic_auth => @auth)
  end

end
