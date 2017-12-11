class Aldebaran_carriers_contract_regions

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

  def post(cnpj, branch, contractId, body)
    self.class.post("/aldebaran-carriers/carriers/#{cnpj}/contracts/#{branch}/#{contractId}/regions", :basic_auth => @auth, :body => body.to_json)
  end

  def putBatch(cnpj, branch, contractId, body)
    self.class.put("/aldebaran-carriers/carriers/#{cnpj}/contracts/#{branch}/#{contractId}/regions", :basic_auth => @auth, :body => body.to_json)
  end

  def putID(cnpj, branch, contractId, id, body)
    self.class.put("/aldebaran-carriers/carriers/#{cnpj}/contracts/#{branch}/#{contractId}/regions/#{id}", :basic_auth => @auth, :body => body.to_json)
  end

  def delete(cnpj, branch, contractId, id)
    self.class.delete("/aldebaran-carriers/carriers/#{cnpj}/contracts/#{branch}/#{contractId}/regions/#{id}", :basic_auth => @auth)
  end

end
