class Carriers_regions

  def self.create_contract_01_region
    carriersHash = YAML.load_file('./fixtures/templates/create_carriers_contracts_regions.yml')['get_01_region'].dup
    carriersHash["regions"][0]["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")
    return carriersHash
  end

  def self.create_contract_02_regions
    carriersHash = YAML.load_file('./fixtures/templates/create_carriers_contracts_regions.yml')['get_02_regions'].dup
    carriersHash["regions"][0]["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")
    carriersHash["regions"][1]["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")
    return carriersHash
  end


  def self.input_value_root_for_01_region(field, value, hashBody_Carrier)

    carriersHash = hashBody_Carrier

    case value
      when "null"
        carriersHash["regions"][0][field] = nil

      when "empty"
        carriersHash["regions"][0][field] = ""

      when "string"
        carriersHash["regions"][0][field] = "Teste"

      when "integer"
          carriersHash["regions"][0][field] = Faker::Number.number(1).to_i

      when "true"
        carriersHash["regions"][0][field] = true

      when "false"
        carriersHash["regions"][0][field] = false

      when "faker"
        carriersHash["regions"][0][field] = Faker::CNPJ.numeric.to_i

      else
        carriersHash["regions"][0][field] = value.to_s
    end

    return carriersHash

  end


  def self.input_value_subLevel_for_01_region(field, value, hashBody_Carrier)

    carriersHash = hashBody_Carrier

    case value
      when "null"
        carriersHash["regions"][0]["trackingUpdate"][field] = nil

      when "empty"
        carriersHash["regions"][0]["trackingUpdate"][field] = ""

      when "string"
        carriersHash["regions"][0]["trackingUpdate"][field] = "Teste"

      when "integer"
        carriersHash["regions"][0]["trackingUpdate"][field] = Faker::Number.number(1).to_i

      when "true"
        carriersHash["regions"][0]["trackingUpdate"][field] = true

      when "false"
        carriersHash["regions"][0]["trackingUpdate"][field] = false

      when "faker"
        carriersHash["regions"][0]["trackingUpdate"][field] = Faker::CNPJ.numeric.to_i

      else
        carriersHash["regions"][0]["trackingUpdate"][field] = value.to_s
    end

    return carriersHash

  end

end
