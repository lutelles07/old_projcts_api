class UpdateB2bpartners

  # def self.getRequest_b2bpartners(hash_response)
  #   b2bpartners = YAML.load_file('./fixtures/templates/b2bpartners.yml').dup
  #
  #   b2bpartners['agenciaBanco']     = hash_response['agenciaBanco']
  #   b2bpartners['bairroFat']        = hash_response['bairroFat']
  #   b2bpartners['banco']            = hash_response['banco']
  #   b2bpartners['cepFatIn']         = hash_response['cepFatIn']
  #   b2bpartners['cidadeFat']        = hash_response['cidadeFat']
  #   b2bpartners['contaBanco']       = hash_response['contaBanco']
  #   b2bpartners['dgAgenciaBanco']   = hash_response['dgAgenciaBanco']
  #   b2bpartners['dgCtaBanco']       = hash_response['dgCtaBanco']
  #   b2bpartners['dtNasc']           = hash_response['dtNasc']
  #   b2bpartners['emailFat']         = hash_response['emailFat']
  #   b2bpartners['idCia']            = hash_response['idCia']
  #   b2bpartners['idClasfCliente']   = hash_response['idClasfCliente']
  #   b2bpartners['idClienteFat']     = hash_response['idClienteFat']
  #   b2bpartners['idTipclieFat']     = hash_response['idTipclieFat']
  #   b2bpartners['idUnineg']         = hash_response['idUnineg']
  #   b2bpartners['insestFat']        = hash_response['insestFat']
  #   b2bpartners['logradouroFat']    = hash_response['logradouroFat']
  #   b2bpartners['nmFavorecido']     = hash_response['nmFavorecido']
  #   b2bpartners['nomeFat']          = hash_response['nomeFat']
  #   b2bpartners['paisFat']          = "Brasil"
  #   b2bpartners['sexo']             = hash_response['sexo']
  #   b2bpartners['tel1Fat']          = hash_response['tel1Fat']
  #   b2bpartners['tel2Fat']          = hash_response['tel2Fat']
  #   b2bpartners['telFatIn']         = hash_response['telFatIn']
  #   b2bpartners['tpConta']          = hash_response['tpConta']
  #   b2bpartners['ufFat']            = hash_response['ufFat']
  #   return b2bpartners
  # end


  def self.update_b2bpartners_agenciaBanco(hash_body, value)
    b2bpartners = hash_body

    if  value == ""
        b2bpartners['agenciaBanco'] = value
    else
        b2bpartners['agenciaBanco'] = value.to_i
    end

    return b2bpartners
  end


  def self.update_b2bpartners_bairroFat(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['bairroFat'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_banco(hash_body, value)
    b2bpartners = hash_body

    if  value == ""
        b2bpartners['banco'] = value
    else
        b2bpartners['banco'] = value.to_i
    end

    return b2bpartners
  end


  def self.update_b2bpartners_contaBanco(hash_body, value)
    b2bpartners = hash_body

    if  value == ""
        b2bpartners['contaBanco'] = value
    else
        b2bpartners['contaBanco'] = value.to_i
    end

    return b2bpartners
  end


  def self.update_b2bpartners_dgAgenciaBanco(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['dgAgenciaBanco'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_dgCtaBanco(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['dgCtaBanco'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_dtNasc(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['dtNasc'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_emailFat(hash_body, value)
    b2bpartners = hash_body

    if  value == ""
        b2bpartners['contaBanco'] = value
    else
        b2bpartners['emailFat'] = Faker::Internet.email
    end

    return b2bpartners
  end


  def self.update_b2bpartners_idCia(hash_body, value)
    b2bpartners = hash_body

    if  value == ""
        b2bpartners['idCia'] = value
    else
        b2bpartners['idCia'] = value.to_i
    end

    return b2bpartners
  end


  def self.update_b2bpartners_idClasfCliente(hash_body, value)
    b2bpartners = hash_body

    if  value == ""
        b2bpartners['idClasfCliente'] = value
    else
        b2bpartners['idClasfCliente'] = value.to_i
    end

    return b2bpartners
  end


  def self.update_b2bpartners_idClienteFat(hash_body, value)
    b2bpartners = hash_body

    if  value == "fakeCNPJ"
        b2bpartners['idClienteFat'] = Faker::CNPJ.numeric
    elsif   value == "fakeCPF"
            b2bpartners['idClienteFat'] = Faker::CPF.numeric
    else
        b2bpartners['idClienteFat'] = value
    end

    return b2bpartners
  end


  def self.update_b2bpartners_idTipclieFat(hash_body, value)
    b2bpartners = hash_body

    if  value == ""
      b2bpartners['idTipclieFat'] = value
    else
      b2bpartners['idTipclieFat'] = value.to_i
    end

    return b2bpartners
  end


  def self.update_b2bpartners_idUnineg(hash_body, value)
    b2bpartners = hash_body

    if  value == ""
      b2bpartners['idUnineg'] = value
    else
      b2bpartners['idUnineg'] = value.to_i
    end

    return b2bpartners
  end


  def self.update_b2bpartners_insestFat(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['insestFat'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_logradouroFat(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['logradouroFat'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_nmFavorecido(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['nmFavorecido'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_nomeFat(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['nomeFat'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_numeroFat(hash_body, value)
    b2bpartners = hash_body

    if  value == ""
        b2bpartners['numeroFat'] = value
    else
        b2bpartners['numeroFat'] = value.to_i
    end

    return b2bpartners
  end


  def self.update_b2bpartners_referenciaFat(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['referenciaFat'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_tel1Fat(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['tel1Fat'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_tel2Fat(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['tel2Fat'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_telFatIn(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['telFatIn'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_tpConta(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['tpConta'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_ufFat(hash_body, value)
    b2bpartners = hash_body

    b2bpartners['ufFat'] = value

    return b2bpartners
  end


  def self.update_b2bpartners_addressData(hash_body, value, cep, cidade, uf)
    b2bpartners = hash_body

    if value == "validAddress"
      b2bpartners['cepFatIn']   = cep
      b2bpartners['cidadeFat']  = cidade
      b2bpartners['ufFat']      = uf
    end

    return b2bpartners
  end


end