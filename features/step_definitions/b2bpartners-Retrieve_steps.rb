Given(/^GET B2BPartners Id from database$/) do
  b2b_partners_repository = B2BPartnersRepository.new

  @b2b_partner_id = b2b_partners_repository.get_b2bpartner_id
end


When(/^GET in B2BPartners by id passing a "([^"]*)" authentication$/) do |authentication|
  b2bpartnersContract = B2BpartnersAPI.new(authentication)

  #Passing ID from database
  @response = b2bpartnersContract.get_by_id(@b2b_partner_id)

  Debug.new.debug(@response)
end


When(/^GET in B2BPartners to list all cnpj passing a "([^"]*)" authentication$/) do |authentication|
  b2bpartnersContract = B2BpartnersAPI.new(authentication)

  @response = b2bpartnersContract.get_cnpj

  Debug.new.debug(@response)
end


And(/^compare b2bpartners\-retrieve with database$/) do

  @b2b_partner_detail = B2BPartnersRepository.new.get_details(@b2b_partner_id)[0]

  #Comparison the response with database and ignoring all accents;
  #Some fields are optional and that's why I need to check if the key is present before comparing
  if  @response.key?('agenciaBanco')
      expect(@response['agenciaBanco']).to eq @b2b_partner_detail['CIUN_AGENCIA']
  end

  if  @response.key?('bairroFat')
      bairro_formatted_response = Utils.new.remove_accents(@response['bairroFat'].to_s)
      bairro_formatted_database = Utils.new.remove_accents(@b2b_partner_detail['CLEN_BAIRRO'].to_s)

      expect(bairro_formatted_response).to eq bairro_formatted_database
  end

  if  @response.key?('banco')
      expect(@response['banco']).to eq @b2b_partner_detail['CIUN_BANCO']
  end

  if  @response.key?('cepFatIn')
      expect(@response['cepFatIn']).to eq @b2b_partner_detail['CLEN_CEP']
  end

  if  @response.key?('compleFat')
      expect(@response['compleFat']).to eq @b2b_partner_detail['CLEN_COMPLEMENTO']
  end

  if  @response.key?('contaBanco')
      expect(@response['contaBanco']).to eq @b2b_partner_detail['CIUN_CONTA']
  end

  if  @response.key?('dgAgenciaBanco')
      expect(@response['dgAgenciaBanco']).to eq @b2b_partner_detail['CIUN_AGENCIA_DV']
  end

  if  @response.key?('dgCtaBanco')
      expect(@response['dgCtaBanco']).to eq @b2b_partner_detail['CIUN_CONTA_DV']
  end

  if  @response.key?('dtNasc')
      expect(@response['dtNasc']).to eq (@b2b_partner_detail['CLIE_DT_NASC']).to_s[0..9]
  end

  if  @response.key?('emailFat')
      expect(@response['emailFat']).to eq @b2b_partner_detail['CLIE_EMAIL']
  end

  if  @response.key?('idCia')
      expect(@response['idCia']).to eq @b2b_partner_detail['CIUN_ID_CIA']
  end

  if  @response.key?('idClasfCliente')
      expect(@response['idClasfCliente']).to eq @b2b_partner_detail['CLIE_ID_CLASF_CLIENTE']
  end

  if  @response.key?('idClienteFat')
      expect(@response['idClienteFat']).to eq @b2b_partner_detail['CLIE_ID_TERCEIRO'].to_s
  end

  if  @response.key?('idTipclieFat')
      expect(@response['idTipclieFat']).to eq @b2b_partner_detail['CLIE_ID_TIPCLI']
  end

  if  @response.key?('idUnineg')
      expect(@response['idUnineg']).to eq @b2b_partner_detail['CIUN_ID_UNINEG']
  end

  if  @response.key?('insestFat')
      expect(@response['insestFat']).to eq @b2b_partner_detail['CLIE_INSEST']
  end

  if  @response.key?('logradouroFat')
      logradouro_formatted_response = Utils.new.remove_accents(@response['logradouroFat'].to_s)
      logradouro_formatted_database = Utils.new.remove_accents(@b2b_partner_detail['CLEN_END'].to_s)

      expect(logradouro_formatted_response).to eq logradouro_formatted_database
  end

  if  @response.key?('nmFavorecido')
      nmFavorecido_formatted_response = Utils.new.remove_accents(@response['nmFavorecido'].to_s)
      nmFavorecido_formatted_database = Utils.new.remove_accents(@b2b_partner_detail['CIUN_NOME_FAVORECIDO'].to_s)

      expect(nmFavorecido_formatted_response).to eq nmFavorecido_formatted_database
  end

  if  @response.key?('nomeFat')
      nomeFat_formatted_response = Utils.new.remove_accents(@response['nomeFat'].to_s)
      nomeFat_formatted_database = Utils.new.remove_accents(@b2b_partner_detail['CIUN_NOME'].to_s)

      expect(nomeFat_formatted_response).to eq nomeFat_formatted_database
  end

  if  @response.key?('numeroFat')
      expect(@response['numeroFat']).to eq @b2b_partner_detail['CLEN_NUMERO']
  end

  if  @response.key?('paisFat')
      expect(@response['paisFat']).to eq @b2b_partner_detail['PAIS']
  end

  if  @response.key?('referenciaFat')
      expect(@response['referenciaFat']).to eq @b2b_partner_detail['CLEN_REFERENCIA']
  end

  if  @response.key?('sexo')
      expect(@response['sexo']).to eq @b2b_partner_detail['CLIE_SEXO']
  end

  if  @response.key?('tel1Fat')
      expect(@response['tel1Fat']).to eq @b2b_partner_detail['CLIE_TEL1']
  end

  if  @response.key?('tel2Fat')
      expect(@response['tel2Fat']).to eq @b2b_partner_detail['CLIE_TEL2']
  end

  if  @response.key?('telFatIn')
    expect(@response['telFatIn']).to eq @b2b_partner_detail['CLIE_TEL']
  end

  if  @response.key?('tpConta')
      expect(@response['tpConta']).to eq @b2b_partner_detail['CIUN_TP_CONTA']
  end

end