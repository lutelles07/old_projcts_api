class GetToken
  include HTTParty

  base_uri ENVIRONMENT["token"]
  format :json
  headers 'Content-Type' =>  'application/x-www-form-urlencoded'

def initialize
  @body_cte = AUTH['token_cte']
end
#-------------------------------------------------------------------------

  def get_token_cte
    self.class.post('/auth/realms/vmcommerce/protocol/openid-connect/token', body: @body_cte)
  end

end
