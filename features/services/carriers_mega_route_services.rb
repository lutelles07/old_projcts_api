class AldebaranCarriesMegaRouteServices
  include HTTParty
  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json'

  def initialize
    @auth = {
        username: AUTH['valid']['username'],
        password: AUTH['valid']['password']
    }
    @auth_invalid = {
        username: AUTH['invalid_username']['username'],
        password: AUTH['invalid_username']['password']
    }
    @list_mega_rota = Aldebaran_Carriers.new.get_cnpj_transp
    index = rand(0..(@list_mega_rota.length-1))
    @cnpj_id = @list_mega_rota[index]["MEGA_ID_TRANSP"]
    @id_mega_rota = @list_mega_rota[index]["MEGA_ID_MEGA_ROTA"]
  end

#==================================================================================================
# CARRIERS MEGA ROUTE API
#==================================================================================================
  def create_mega_route(body)
    self.class.post("/aldebaran-carriers/carriers/#{@cnpj_id}/megaroutes", :basic_auth => @auth, :body => body.to_json)
  end

  def update_mega_route(body)
    self.class.put("/aldebaran-carriers/carriers/#{@cnpj_id}/megaroutes/#{@id_mega_rota}", :basic_auth => @auth, :body => body.to_json)
  end

  def delete_mega_route(cnpj, id)
    self.class.delete("/aldebaran-carriers/carriers/#{cnpj}/megaroutes/#{id}", :basic_auth => @auth)
  end

  def mega_route_auth_invalid(body)
    self.class.post("/aldebaran-carriers/carriers/#{@cnpj_id}/megaroutes", :basic_auth => @auth_invalid, :body => body.to_json)
  end

  def mega_route_service_not_supported(body)
    self.class.get("/aldebaran-carriers/carriers/#{@cnpj_id}/megaroutes", :basic_auth => @auth, :body => body.to_json)
  end

end
