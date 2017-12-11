class Carriers_contract_regions

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

  def post(cnpj, branch, contractId, id, body)
    self.class.post("/aldebaran-carriers/carriers/#{cnpj}/contracts/#{branch}/#{contractId}/regions/#{id}/zipcodes", :basic_auth => @auth, :body => body.to_json)
  end

  def put(cnpj, branch, contractId, id, cepini, cepfim, body)
    self.class.put("/aldebaran-carriers/carriers/#{cnpj}/contracts/#{branch}/#{contractId}/regions/#{id}/zipcodes/#{cepini}/#{cepfim}", :basic_auth => @auth, :body => body.to_json)
  end

  def delete(cnpj, branch, contractId, id, cepini, cepfim)
    self.class.delete("/aldebaran-carriers/carriers/#{cnpj}/contracts/#{branch}/#{contractId}/regions/#{id}/zipcodes/#{cepini}/#{cepfim}", :basic_auth => @auth)
  end

end
