class CreateB2bpartners

  def self.create_b2bpartners
    b2bpartners = YAML.load_file('./fixtures/templates/b2bpartners.yml').dup
    b2bpartners['idClienteFat'] = Faker::CNPJ.numeric
    b2bpartners['emailFat']     = Faker::Internet.email

    return b2bpartners
  end


  def self.create_b2bpartners_agenciaBanco(value)
    b2bpartners = create_b2bpartners

    b2bpartners['agenciaBanco'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_bairroFat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['bairroFat'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_banco(value)
    b2bpartners = create_b2bpartners

    b2bpartners['banco'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_cepFatIn(value)
    b2bpartners = create_b2bpartners

    b2bpartners['cepFatIn'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_cidadeFat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['cidadeFat'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_contaBanco(value)
    b2bpartners = create_b2bpartners

    b2bpartners['contaBanco'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_dgAgenciaBanco(value)
    b2bpartners = create_b2bpartners

    b2bpartners['dgAgenciaBanco'] = value

    return b2bpartners
  end



  def self.create_b2bpartners_dgCtaBanco(value)
    b2bpartners = create_b2bpartners

    b2bpartners['dgCtaBanco'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_dtNasc(value)
    b2bpartners = create_b2bpartners

    b2bpartners['dtNasc'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_emailFat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['emailFat'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_idCia(value)
    b2bpartners = create_b2bpartners

    b2bpartners['idCia'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_idClasfCliente(value)
    b2bpartners = create_b2bpartners

    b2bpartners['idClasfCliente'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_idClienteFat(clienFat, idTipclieFat)
    b2bpartners = create_b2bpartners

    b2bpartners['idClienteFat'] = clienFat
    b2bpartners['idTipclieFat'] = idTipclieFat

    return b2bpartners
  end


  def self.create_b2bpartners_idTipclieFat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['idTipclieFat'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_idUnineg(value)
    b2bpartners = create_b2bpartners

    b2bpartners['idUnineg'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_insestFat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['insestFat'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_logradouroFat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['logradouroFat'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_nmFavorecido(value)
    b2bpartners = create_b2bpartners

    b2bpartners['nmFavorecido'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_nomeFat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['nomeFat'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_paisFat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['paisFat'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_sexo(value)
    b2bpartners = create_b2bpartners

    b2bpartners['sexo'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_tel1Fat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['tel1Fat'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_tel2Fat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['tel2Fat'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_telFatIn(value)
    b2bpartners = create_b2bpartners

    b2bpartners['telFatIn'] = value

    return b2bpartners
  end


  def self.create_b2bpartners_tpConta(value)
    b2bpartners = create_b2bpartners

    b2bpartners['tpConta'] = value

    return b2bpartners
  end

  def self.create_b2bpartners_ufFat(value)
    b2bpartners = create_b2bpartners

    b2bpartners['ufFat'] = value

    return b2bpartners
  end

end
