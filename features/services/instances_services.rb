class InstanceAPI

  include HTTParty

  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'INSTANCES - '+ DateTime.now.strftime("%FT%T")

  def initialize(authentication)
    @auth = {
        username: AUTH[authentication]['username'],
        password: AUTH[authentication]['password']
    }
  end

  #==================================================================================================
  # CONTRACT API
  #==================================================================================================

  def get_by_id(id)
    self.class.get("/aldebaran-instances/instances/#{id}", :basic_auth => @auth)
  end

  def post_by_id(id, hashbody)
    self.class.post("/aldebaran-instances/instances/#{id}/messageparameters", :basic_auth => @auth, :body => hashbody.to_json)
  end

end
