class Carriers_update

  def self.update_contract_01_region
    carriersHash = YAML.load_file('./fixtures/templates/update_carriers_contracts_regions.yml')['update_01_region'].dup
    carriersHash["regions"][0]["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")
    return carriersHash
  end

  def self.update_contract_01_region_batch
    carriersHash = YAML.load_file('./fixtures/templates/update_carriers_contracts_regions.yml')['update_01_region_batch'].dup
    carriersHash["regions"][0]["trackingUpdate"]["dateTime"] = Time.now.strftime("%Y-%m-%dT00:00:00.000Z")
    return carriersHash
  end


end
