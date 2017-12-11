class B2BContractsFactory

  def self.post_b2bcontracts(in_client)
    b2bcontracts = YAML.load_file('./fixtures/templates/b2bcontracts.yml')['create_contracs_b2b'].dup

    b2bcontracts['idCliente'] = in_client.to_s
    b2bcontracts['numContrato'] = Faker::Number.number(8).to_i
    b2bcontracts['numSubContrato'] = b2bcontracts['numContrato']

    return b2bcontracts
  end

  def self.put_b2bcontracts(in_client, num_contract, num_subcontract)
    b2bcontracts = YAML.load_file('./fixtures/templates/b2bcontracts.yml')['create_contracs_b2b'].dup

    b2bcontracts['idCliente'] = in_client.to_s
    b2bcontracts['numContrato'] = num_contract
    b2bcontracts['numSubContrato'] = num_subcontract
    b2bcontracts['logradouroCob'] = "Avenida" " " + Faker::Name.first_name
    b2bcontracts['numeroCob'] = Faker::Number.number(4).to_i
    b2bcontracts['cepCob'] = Faker::Number.number(7).to_i
    b2bcontracts['cidadeCob'] = "SAO PAULO"

    return b2bcontracts
  end

  def self.post_b2bcontracts_without_field(in_client, field)
    b2bcontracts = YAML.load_file('./fixtures/templates/b2bcontracts.yml')['create_contracs_b2b'].dup

    b2bcontracts['idCliente'] = in_client.to_s
    b2bcontracts['numContrato'] = Faker::Number.number(8).to_i
    b2bcontracts['numSubContrato'] = b2bcontracts['numContrato']
    b2bcontracts["#{field}"] = nil

    return b2bcontracts
  end

  def self.put_b2bcontracts_without_idCliente(num_contract, num_subcontract)
    b2bcontracts = YAML.load_file('./fixtures/templates/b2bcontracts.yml')['create_contracs_b2b'].dup

    b2bcontracts["idCliente"] = nil
    b2bcontracts['numContrato'] = num_contract
    b2bcontracts['numSubContrato'] = num_subcontract

    return b2bcontracts
  end

  def self.put_b2bcontracts_without_numContrato(in_client, num_subcontract)
    b2bcontracts = YAML.load_file('./fixtures/templates/b2bcontracts.yml')['create_contracs_b2b'].dup

    b2bcontracts["idCliente"] = in_client.to_s
    b2bcontracts['numContrato'] = nil
    b2bcontracts['numSubContrato'] = num_subcontract

    return b2bcontracts
  end

  def self.put_b2bcontracts_without_numSubContrato(in_client, num_contract)
    b2bcontracts = YAML.load_file('./fixtures/templates/b2bcontracts.yml')['create_contracs_b2b'].dup

    b2bcontracts["idCliente"] = in_client.to_s
    b2bcontracts['numContrato'] = num_contract
    b2bcontracts['numSubContrato'] = nil

    return b2bcontracts
  end

  def self.put_b2bcontracts_without_field(in_client, num_contract, num_subcontract, field)
    b2bcontracts = YAML.load_file('./fixtures/templates/b2bcontracts.yml')['create_contracs_b2b'].dup

    b2bcontracts['idCliente'] = in_client.to_s
    b2bcontracts['numContrato'] = num_contract
    b2bcontracts['numSubContrato'] = num_subcontract
    b2bcontracts["#{field}"] = nil

    return b2bcontracts
  end

end
