class B2BcontracttypesAPI

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'B2BCONTRACTS TYPES - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end

  #==================================================================================================
  # CONTRACT API
  #==================================================================================================

  def get(field)
    self.class.get("/aldebaran-b2bcontracttypes/b2bcontracttypes/#{field}", :basic_auth => @auth)
  end


end
