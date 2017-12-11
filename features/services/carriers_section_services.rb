class CarriersSectionServices

  include HTTParty
  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'x-tid'  => 'ald-sections-'+ DateTime.now.strftime("%FT%T")

#==================================================================================================
# CARRIERS SECTION API
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
    @list_id_corte = Aldebaran_Carriers.new.get_section_id_corte
    index = rand(0..(@list_id_corte.length-1))
    @id_corte = @list_id_corte[index]["CORT_ID_CORTE"]
  end

  def create_section(body)
    self.class.post("/aldebaran-carriers/carriers/sections", :basic_auth => @auth, :body => body.to_json)
  end

  def create_section_unauthorized(body)
    self.class.post("/aldebaran-carriers/carriers/sections", :basic_auth => @auth_invalid, :body => body.to_json)
  end

  def update_section(body)
    self.class.put("/aldebaran-carriers/carriers/sections/#{@id_corte}", :basic_auth => @auth, :body => body.to_json)
  end

  def update_section_unauthorrized(body)
    self.class.put("/aldebaran-carriers/carriers/sections/#{@id_corte}", :basic_auth => @auth_invalid, :body => body.to_json)
  end

  def get_section
    self.class.get("/aldebaran-carriers/carriers/sections", :basic_auth => @auth)
  end
end
