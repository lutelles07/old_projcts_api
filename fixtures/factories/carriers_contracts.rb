class Carriers_contract

  def self.create_contract

    carriersHash = YAML.load_file('./fixtures/templates/carriers_contracts.yml')['create_carrier_contracts'].dup

    carriersHash["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")

    return carriersHash
  end


  def self.update_contract

    carriersHash = YAML.load_file('./fixtures/templates/carriers_contracts.yml')['update_carrier_contracts'].dup

    carriersHash["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")

    return carriersHash
  end


  def self.formatting_carrier_root(field, value, body_hash)

    carriersHash = body_hash

    case value
      when "null"
        carriersHash[field] = nil

      when "empty"
        carriersHash[field] = ""

      when "string"
        carriersHash[field] = Faker::Team.sport

      when "integer"
        if field == "deliveryType" || field == "transportType" || field == "branch"
            carriersHash[field] = 4
        else
          carriersHash[field] = Faker::Number.number(1).to_i
        end

      when "true"
        carriersHash[field] = true

      when "false"
        carriersHash[field] = false

      when "faker"
        carriersHash[field] = Faker::CNPJ.numeric.to_i

      when "N1"
        carriersHash[field] = 1

      when "N2"
        carriersHash[field] = 2

      when "N3"
        carriersHash[field] = 3

      when "N5"
        carriersHash[field] = 5

      when "N9"
        carriersHash[field] = 9

      when "N10"
        carriersHash[field] = 10

      when "N11"
        carriersHash[field] = 11

      when "N12"
        carriersHash[field] = 12

      when "N20"
        carriersHash[field] = 20

      else
          carriersHash[field] = value
    end

    return carriersHash
  end



  def self.formatting_carrier_level2(field, value, block, body_hash)

    carriersHash = body_hash

    case value
      when "null"
        carriersHash[block][field] = nil

      when "empty"
        carriersHash[block][field] = ""

      when "string"
        carriersHash[block][field] = Faker::Team.sport

      when "integer"
        carriersHash[block][field] = Random.rand(1...9)

      when "true"
        carriersHash[block][field] = true

      when "false"
        carriersHash[block][field] = false

      else
        carriersHash[block][field] = value
    end

    return carriersHash
  end


end
