class BuyingcostsAPI

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'BUYINGCOSTS - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end

  #==================================================================================================
  # CONTRACT API
  #==================================================================================================

  def get(planta, sky)
    self.class.get("/aldebaran-buyingcosts/buyingcosts/#{planta}/#{sky}", :basic_auth => @auth)
  end


end
