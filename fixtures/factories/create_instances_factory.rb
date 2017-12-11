class Create_instances

  #Get the template with only a array
  def self.create_instance_01_occur
    instancesHash = YAML.load_file('./fixtures/templates/create_instances.yml')['instances_01_occur'].dup
    return instancesHash
  end


  #Get the template with 15 arrays
  def self.create_instance_15_occur
    instancesHash = YAML.load_file('./fixtures/templates/create_instances.yml')['instances_15_occurs'].dup
    return instancesHash
  end


  #Format the template with database values
  def self.create_instances(listValue, countBody)

    case countBody
      when 1
        instancesHash = create_instance_01_occur
      when 15
        instancesHash = create_instance_15_occur
    end

    countBody.times do|i|
      instancesHash["messageParameters"][i]["name"] = listValue[i]["VARV_ID_VARIAVEL"].to_s
    end

    return instancesHash
  end

end