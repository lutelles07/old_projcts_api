When(/^PUT in B2BPartners with "([^"]*)" equal "([^"]*)" passing a "([^"]*)" authentication$/) do |field, value, authentication|

  @authentication = authentication

  #Response from GET request which will be updated
  hash_response_GET = JSON.parse(@response.body)
  hash_response_GET['paisFat'] = "Brasil"

  case field

    when "agenciaBanco"
          @hash_body = UpdateB2bpartners.update_b2bpartners_agenciaBanco(hash_response_GET, value)

    when "bairroFat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_bairroFat(hash_response_GET, value)

    when "banco"
          @hash_body = UpdateB2bpartners.update_b2bpartners_banco(hash_response_GET, value)

    when "contaBanco"
          @hash_body = UpdateB2bpartners.update_b2bpartners_contaBanco(hash_response_GET, value)

    when "dgAgenciaBanco"
          @hash_body = UpdateB2bpartners.update_b2bpartners_dgAgenciaBanco(hash_response_GET, value)

    when "dgCtaBanco"
          @hash_body = UpdateB2bpartners.update_b2bpartners_dgCtaBanco(hash_response_GET, value)

    when "dtNasc"
          @hash_body = UpdateB2bpartners.update_b2bpartners_dtNasc(hash_response_GET, value)

    when "emailFat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_emailFat(hash_response_GET, value)

    when "idCia"
          @hash_body = UpdateB2bpartners.update_b2bpartners_idCia(hash_response_GET, value)

    when "idClasfCliente"
          @hash_body = UpdateB2bpartners.update_b2bpartners_idClasfCliente(hash_response_GET, value)

    when "idClienteFat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_idClienteFat(hash_response_GET, value)

    when "idTipclieFat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_idTipclieFat(hash_response_GET, value)

    when "idUnineg"
          @hash_body = UpdateB2bpartners.update_b2bpartners_idUnineg(hash_response_GET, value)

    when "insestFat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_insestFat(hash_response_GET, value)

    when "logradouroFat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_logradouroFat(hash_response_GET, value)

    when "nmFavorecido"
          @hash_body = UpdateB2bpartners.update_b2bpartners_nmFavorecido(hash_response_GET, value)

    when "nomeFat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_nomeFat(hash_response_GET, value)

    when "numeroFat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_numeroFat(hash_response_GET, value)

    when "referenciaFat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_referenciaFat(hash_response_GET, value)

    when "tel1Fat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_tel1Fat(hash_response_GET, value)

    when "tel2Fat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_tel2Fat(hash_response_GET, value)

    when "telFatIn"
          @hash_body = UpdateB2bpartners.update_b2bpartners_telFatIn(hash_response_GET, value)

    when "tpConta"
          @hash_body = UpdateB2bpartners.update_b2bpartners_tpConta(hash_response_GET, value)

    when "addressData"
          @hash_body = UpdateB2bpartners.update_b2bpartners_addressData(hash_response_GET, value, @cep, @cidade, @uf)

    when "ufFat"
          @hash_body = UpdateB2bpartners.update_b2bpartners_ufFat(hash_response_GET, value)

  end

  @b2b_partner_id = @hash_body["idClienteFat"]

  #Call the method to invoke the PUT request
  @response = put_create_new_b2bpartner(@hash_body)

  Debug.new.debug(@response)
end


def put_create_new_b2bpartner(body)
    return B2BpartnersAPI.new(@authentication).put_b2bpartnes(body)
end


Given(/^that input the data:$/) do |table|

  #Get all data from table
  table.hashes.each do |row|
    @cep    = row["cepFatIn"]
    @cidade = row["cidadeFat"]
    @uf     = row["ufFat"]
  end

end