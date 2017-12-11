class Aldebaran_Tippler_Service
  include HTTParty
  base_uri ENVIRONMENT["server"]
  format :json
  headers 'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'X-tid'  => 'Tippler-'+ DateTime.now.strftime("%FT%T")
  def initialize
    @auth = {
        username: AUTH['valid']['username'],
        password: AUTH['valid']['password']
    }
    @auth_invalid = {
        username: AUTH['invalid_username']['username'],
        password: AUTH['invalid_username']['password']
    }
    @id_data = DEFAULT_DATA
  end

#==================================================================================================
# TIPPLER API
#==================================================================================================

  def file_query_edis_rev
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_sequential_rev']}/edis", :basic_auth => @auth)
  end

  def file_query_invoices_rev
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_sequential_rev']}/invoices", :basic_auth => @auth)
  end

  def file_query_edis_rem
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_sequential_rem']}/edis", :basic_auth => @auth)
  end

  def file_query_invoice_rem
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_sequential_rem']}/invoices", :basic_auth => @auth)
  end

  def fime_query_checklist
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_sequential_chk']}/checklists", :basic_auth => @auth)
  end

  def get_invalid_user
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_sequential_rev']}/edis", :basic_auth => @auth_invalid)
  end

  def file_query_edis_invalid
    self.class.get("/aldebaran-tippler/tippler/notfis/aaaa/edis", :basic_auth => @auth)
  end

  def file_query_edis_not_existent
    self.class.get("/aldebaran-tippler/tippler/notfis/1111/edis", :basic_auth => @auth)
  end

  def file_query_chk_down_alternative
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_alternative_chk']}/checklists", :basic_auth => @auth)
  end

  def file_query_rem_down_alternative
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_alternative_rem']}/edis", :basic_auth => @auth)
  end

  def file_query_rev_down_alternative
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_alternative_rev']}/edis", :basic_auth => @auth)
  end

  def file_query_rem_invoice_down_alternative
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_alternative_rem']}/invoices", :basic_auth => @auth)
  end

  def file_query_rev_invoice_down_alternative
    self.class.get("/aldebaran-tippler/tippler/notfis/#{@id_data['id_alternative_rev']}/invoices", :basic_auth => @auth)
  end

end
