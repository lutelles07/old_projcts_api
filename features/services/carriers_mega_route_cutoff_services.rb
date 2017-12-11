class CarriesMegaRouteCutoffServices
  include HTTParty
  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'x-tid'  => 'ald-cutoff-'+ DateTime.now.strftime("%FT%T")

#==================================================================================================
# CARRIERS MEGA ROUTE API
#==================================================================================================
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
    @id_corte = @list_mega_rota[index]["MEGA_ID_MEGA_ROTA"]
  end

  def create_mega_route_cutoff(body)
    self.class.post("/aldebaran-carriers/carriers/#{@cnpj_id}/megaroutes/#{@id_corte}/cutoffs/2", :basic_auth => @auth, :body => body.to_json)
  end

  def create_mega_route_cutoff_unauthorized(body)
    self.class.post("/aldebaran-carriers/carriers/#{@cnpj_id}/megaroutes/#{@id_corte}/cutoffs/2", :basic_auth => @auth_invalid, :body => body.to_json)
  end

  def update_mega_route_cutoff(cnpj, id_corte, body)
    self.class.put("/aldebaran-carriers/carriers/#{cnpj}/megaroutes/#{id_corte}/cutoffs/2", :basic_auth => @auth, :body => body.to_json)
  end

  def delete_mega_route_cutoff(cnpj, id_corte)
    self.class.delete("/aldebaran-carriers/carriers/#{cnpj}/megaroutes/#{id_corte}/cutoffs/2", :basic_auth => @auth)
  end

  def get_mega_route_cutoff
    self.class.get("/aldebaran-carriers/carriers/#{@cnpj_id}/megaroutes/#{@id_corte}/cutoffs/2", :basic_auth => @auth)
  end

end
