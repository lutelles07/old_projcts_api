class CarriersData

  def self.create_carrier

    $uri_invalid_cnpj_body = nil

    carriersHash = YAML.load_file('./fixtures/templates/create_carriers.yml')['create_carrier'].dup

    #Get a new CNPJ
    carriersHash["partnerData"]["cnpj"] = Faker::CNPJ.numeric.to_i

    carriersHash["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")

    return carriersHash
  end


  def self.invalid_carrier_root(field, value)

    carriersHash = create_carrier

    case value
      when "null"
        carriersHash[field] = nil

      when "empty"
        carriersHash[field] = ""

      when "integer"
        carriersHash[field] = Faker::Number.number(5).to_i

      when "decimal"
        carriersHash[field] = Faker::Number.decimal(1, 20)

      when "true"
        carriersHash[field] = true

      when "false"
        carriersHash[field] = false

      else

        carriersHash[field] = value.to_s

    end

    return carriersHash
  end


  def self.invalid_carrier_insurance(field, value)

    carriersHash = create_carrier

    case value
      when "null"
        carriersHash["insurance"][field] = nil

      when "empty"
        carriersHash["insurance"][field] = ""

      when "true"
        carriersHash["insurance"][field] = true

      when "false"
        carriersHash["insurance"][field] = false

      when "integer"
        carriersHash["insurance"][field] = Faker::Number.number(4).to_i

      when "decimal"
        carriersHash["insurance"][field] = Faker::Number.decimal(2, 7).to_f

      when "zeros"
        carriersHash["insurance"][field] = 0.to_i

      else
        carriersHash["insurance"][field] = value
    end

    return carriersHash
  end


  def self.invalid_carrier_goals(field, value)

    carriersHash = create_carrier

    case value
      when "null"
        carriersHash["goals"][field] = nil

      when "empty"
        carriersHash["goals"][field] = ""

      when "true"
        carriersHash["goals"][field] = true

      when "false"
        carriersHash["goals"][field] = false

      when "integer"
        carriersHash["goals"][field] = Faker::Number.number(4).to_i

      when "decimal"
        carriersHash["goals"][field] = Faker::Number.decimal(1, 29).to_f

      else
        carriersHash["goals"][field] = value.to_s
    end

    return carriersHash
  end



  def self.invalid_carrier_subLevel_freightCalculation(field, value, block)

    carriersHash = create_carrier

    case value
      when "null"
        carriersHash["freightCalculation"][block][field] = nil

      when "empty"
        carriersHash["freightCalculation"][block][field] = ""

      when "integer"
        carriersHash["freightCalculation"][block][field] = Faker::Number.number(4).to_i

      when "decimal"
        carriersHash["freightCalculation"][block][field] = Faker::Number.decimal(1, 29).to_f

      when "true"
        carriersHash["freightCalculation"][block][field] = true

      when "false"
        carriersHash["freightCalculation"][block][field] = false

      else
        carriersHash["freightCalculation"][block][field] = value.to_s
    end

    return carriersHash
  end



  def self.invalid_carrier_subLevel2_partnerData(field, value)

    carriersHash = create_carrier

    case value
      when "null"
        carriersHash["partnerData"][field] = nil

      when "empty"
        carriersHash["partnerData"][field] = ""

      when "integer"
        carriersHash["partnerData"][field] = Faker::Number.number(4).to_i

      when "decimal"
        carriersHash["partnerData"][field] = Faker::Number.decimal(1, 29).to_f

      when "true"
        carriersHash["partnerData"][field] = true

      when "false"
        carriersHash["partnerData"][field] = false

      when "string"
        carriersHash["partnerData"][field] = Faker::StarWars.planet

      else

        if (field == "legalEntityType")
          carriersHash["partnerData"][field] = value.to_i
        else
          carriersHash["partnerData"][field] = value.to_s
        end

    end

    return carriersHash

  end


  def self.invalid_cnpj_body(field, value)

    carriersHash = create_carrier

    case value
      when "null"
        carriersHash["partnerData"]["cnpj"] = nil

      when "empty"
        carriersHash["partnerData"]["cnpj"] = ""

      else
        carriersHash["partnerData"]["cnpj"] = value

    end

    $uri_invalid_cnpj_body = Faker::CNPJ.numeric.to_i

    puts "$uri_invalid_cnpj_body: ", $uri_invalid_cnpj_body

    return carriersHash

  end


  def self.invalid_carrier_subLevel3_partnerData(field, value, block)

    carriersHash = create_carrier

    case value
      when "null"
        carriersHash["partnerData"][block][field] = nil

      when "empty"
        carriersHash["partnerData"][block][field] = ""

      when "integer"
        carriersHash["partnerData"][block][field] = Faker::Number.number(4).to_i

      when "decimal"
        carriersHash["partnerData"][block][field] = Faker::Number.decimal(1, 29).to_f

      when "true"
        carriersHash["partnerData"][block][field] = true

      when "false"
        carriersHash["partnerData"][block][field] = false

      when "string"
        carriersHash["partnerData"][block][field] = Faker::StarWars.planet

      else
        carriersHash["partnerData"][block][field] = value.to_s

    end

    return carriersHash

  end



  def self.invalid_carrier_trackingUpdate(field, value)

    carriersHash = create_carrier

    case value
      when "null"
        carriersHash["trackingUpdate"][field] = nil

      when "empty"
        carriersHash["trackingUpdate"][field] = ""

      when "true"
        carriersHash["trackingUpdate"][field] = true

      when "false"
        carriersHash["trackingUpdate"][field] = false

      when "integer"
        carriersHash["trackingUpdate"][field] = Faker::Number.number(4).to_i

      when "decimal"
        carriersHash["trackingUpdate"][field] = Faker::Number.decimal(2, 7).to_f

      when "zeros"
        carriersHash["trackingUpdate"][field] = 0.to_i

      when "string"
        carriersHash["trackingUpdate"][field] = Faker::StarWars.planet

      else
       carriersHash["trackingUpdate"][field] = value

    end

    return carriersHash
  end


end
