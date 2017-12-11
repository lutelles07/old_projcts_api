class CteServices
  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  def initialize
    get_token = GetToken.new.get_token_cte
    @token = get_token['access_token']
    @headers = {"Authorization" => "Bearer #{@token}", "X-tid"  => "CTE_API - "+ DateTime.now.strftime("%FT%T")}
    @headers_invalid = {"Authorization" => "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6"}
  end

#-------------------------------------------------------------------------------
# CTE API
#-------------------------------------------------------------------------------

  def get_cte_cfop(uf_origen, uf_detino, transfer)
    self.class.get("/aldebaran-cte/cte/cfop/#{uf_origen}/#{uf_detino}/#{transfer}", headers: @headers)
  end

  def get_cte_taxes(price)
    self.class.get("/aldebaran-cte/cte/taxes/#{price}", headers: @headers)
  end

  def get_cte_taxes_user_invalido(price)
    self.class.get("/aldebaran-cte/cte/taxes/#{price}", headers: @headers_invalid)
  end

  def get_cte_taxes_parameter_invalido
    self.class.get("/aldebaran-cte/cte/taxes/", headers: @headers)
  end

end
