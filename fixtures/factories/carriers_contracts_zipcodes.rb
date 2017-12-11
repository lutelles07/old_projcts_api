class Carriers_zipcodes

  def self.create_contract_01_region_zipcode
    carriersHash = YAML.load_file('./fixtures/templates/carriers_contracts_zipcodes.yml')['create_01_region'].dup
    carriersHash["zipCodes"][0]["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")
    return carriersHash
  end

  def self.create_contract_02_regions_zipcode
    carriersHash = YAML.load_file('./fixtures/templates/carriers_contracts_zipcodes.yml')['create_02_regions'].dup
    carriersHash["zipCodes"][0]["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")
    carriersHash["zipCodes"][1]["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")
    return carriersHash
  end

  def self.update_zipcode
    carriersHash = YAML.load_file('./fixtures/templates/carriers_contracts_zipcodes.yml')['update_zicode'].dup
    carriersHash["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")
    return carriersHash
  end


  def self.input_value_root_zipcode_01_region(field, value, hashBody_Carrier)

    carriersHash = hashBody_Carrier

    case value
      when "null"
        carriersHash["zipCodes"][0][field] = nil

      when "empty"
        carriersHash["zipCodes"][0][field] = ""

      when "string"
        carriersHash["zipCodes"][0][field] = "Teste"

      when "integer"
        carriersHash["zipCodes"][0][field] = Faker::Number.number(1).to_i

      when "true"
        carriersHash["zipCodes"][0][field] = true

      when "false"
        carriersHash["zipCodes"][0][field] = false

      when "faker"
        carriersHash["zipCodes"][0][field] = Faker::CNPJ.numeric.to_i

      else
        carriersHash["zipCodes"][0][field] = value.to_s
    end

    return carriersHash

  end


  def self.input_subLevel_zipcode_01_region(field, value, hashBody_Carrier)

    carriersHash = hashBody_Carrier

    case value
      when "null"
        carriersHash["zipCodes"][0]["trackingUpdate"][field] = nil

      when "empty"
        carriersHash["zipCodes"][0]["trackingUpdate"][field] = ""

      when "string"
        carriersHash["zipCodes"][0]["trackingUpdate"][field] = "Teste"

      when "integer"
        carriersHash["zipCodes"][0]["trackingUpdate"][field] = Faker::Number.number(1).to_i

      when "true"
        carriersHash["zipCodes"][0]["trackingUpdate"][field] = true

      when "false"
        carriersHash["zipCodes"][0]["trackingUpdate"][field] = false

      when "faker"
        carriersHash["zipCodes"][0]["trackingUpdate"][field] = Faker::CNPJ.numeric.to_i

      else
        carriersHash["zipCodes"][0]["trackingUpdate"][field] = value.to_s
    end

    return carriersHash

  end


  def self.update_values_zipcode_root(field, value, hashBody_Carrier)

    carriersHash = hashBody_Carrier

    case value
      when "null"
        carriersHash[field] = nil

      when "empty"
        carriersHash[field] = ""

      when "string"
        carriersHash[field] = "Teste"

      when "integer"
        carriersHash[field] = Faker::Number.number(8).to_i

      else
        if  (field == "newZipMin" || field == "newZipMax")
            carriersHash[field] = value.to_i
        else
            carriersHash[field] = value.to_s
        end
    end

    return carriersHash

  end


  def self.update_values_zipcode_trackingUpdate(field, value, hashBody_Carrier)

    carriersHash = hashBody_Carrier

    case value
      when "null"
        carriersHash["trackingUpdate"][field] = nil

      when "empty"
        carriersHash["trackingUpdate"][field] = ""

      when "string"
        carriersHash["trackingUpdate"][field] = "Teste"

      when "integer"
        carriersHash["trackingUpdate"][field] = Faker::Number.number(8).to_i

      else
        carriersHash["trackingUpdate"][field] = value.to_s
    end

    return carriersHash

  end

end
