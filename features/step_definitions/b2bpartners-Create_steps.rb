When(/^POST in B2BPartners passing a "([^"]*)" authentication$/) do |authentication|

  @authentication = authentication

  @hash_body = CreateB2bpartners.create_b2bpartners

  @b2b_partner_id = @hash_body["idClienteFat"]

  #Call the method to invoke the POST request
  post_create_new_b2bpartner(@hash_body)

  Debug.new.debug(@response)
end


When(/^POST in B2BPartners duplicate client passing a "([^"]*)" authentication$/) do |authentication|

  @authentication = authentication

  #Call the method to invoke the POST request
  post_create_new_b2bpartner(@response)

  Debug.new.debug(@response)
end


When(/^POST in B2BPartners with "([^"]*)" equal "([^"]*)" passing a "([^"]*)" authentication$/) do |field, value, authentication|

  @authentication = authentication

  case field

    when "agenciaBanco"
          @hash_body = CreateB2bpartners.create_b2bpartners_agenciaBanco(value)

    when "bairroFat"
          @hash_body = CreateB2bpartners.create_b2bpartners_bairroFat(value)

    when "banco"
          @hash_body = CreateB2bpartners.create_b2bpartners_banco(value)

    when "cepFatIn"
          @hash_body = CreateB2bpartners.create_b2bpartners_cepFatIn(value)

    when "cidadeFat"
          @hash_body = CreateB2bpartners.create_b2bpartners_cidadeFat(value)

    when "contaBanco"
          @hash_body = CreateB2bpartners.create_b2bpartners_contaBanco(value)

    when "dgAgenciaBanco"
          @hash_body = CreateB2bpartners.create_b2bpartners_dgAgenciaBanco(value)

    when "dgCtaBanco"
          @hash_body = CreateB2bpartners.create_b2bpartners_dgCtaBanco(value)

    when "dtNasc"
          @hash_body = CreateB2bpartners.create_b2bpartners_dtNasc(value)

    when "emailFat"
          @hash_body = CreateB2bpartners.create_b2bpartners_emailFat(value)

    when "idCia"
          @hash_body = CreateB2bpartners.create_b2bpartners_idCia(value)

    when "idClasfCliente"
          @hash_body = CreateB2bpartners.create_b2bpartners_idClasfCliente(value)

    when "idTipclieFat"
          @hash_body = CreateB2bpartners.create_b2bpartners_idTipclieFat(value)

    when "idUnineg"
          @hash_body = CreateB2bpartners.create_b2bpartners_idUnineg(value)

    when "insestFat"
          @hash_body = CreateB2bpartners.create_b2bpartners_insestFat(value)

    when "logradouroFat"
          @hash_body = CreateB2bpartners.create_b2bpartners_logradouroFat(value)

    when "nmFavorecido"
          @hash_body = CreateB2bpartners.create_b2bpartners_nmFavorecido(value)

    when "nomeFat"
          @hash_body = CreateB2bpartners.create_b2bpartners_nomeFat(value)

    when "paisFat"
          @hash_body = CreateB2bpartners.create_b2bpartners_paisFat(value)

    when "sexo"
          @hash_body = CreateB2bpartners.create_b2bpartners_sexo(value)

    when "tel1Fat"
          @hash_body = CreateB2bpartners.create_b2bpartners_tel1Fat(value)

    when "tel2Fat"
          @hash_body = CreateB2bpartners.create_b2bpartners_tel2Fat(value)

    when "telFatIn"
          @hash_body = CreateB2bpartners.create_b2bpartners_telFatIn(value)

    when "tpConta"
          @hash_body = CreateB2bpartners.create_b2bpartners_tpConta(value)

    when "ufFat"
        @hash_body = CreateB2bpartners.create_b2bpartners_ufFat(value)

  end

  @b2b_partner_id = @hash_body["idClienteFat"]

  #Call the method to invoke the POST request
  post_create_new_b2bpartner(@hash_body)

  Debug.new.debug(@response)
end


def post_create_new_b2bpartner(body)
  @response = B2BpartnersAPI.new(@authentication).post_b2bpartnes(body)
end


When(/^POST in B2BPartners with idClienteFat equal "([^"]*)" with idTipclieFat equal "([^"]*)" passing a "([^"]*)" authentication$/) do |clientFat, tipclieFat, authentication|
  @authentication = authentication

  @hash_body = CreateB2bpartners.create_b2bpartners_idClienteFat(clientFat, tipclieFat)

  #Call the method to invoke the POST request
  post_create_new_b2bpartner(@hash_body)

  Debug.new.debug(@response)
end