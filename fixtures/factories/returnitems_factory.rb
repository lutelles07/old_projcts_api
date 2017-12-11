class ReturnItemFactory

  def self.put_targetWarranty
    item = [10, 20, 30]
    targetWarranty = item[rand(item.length)]
    returnitems = YAML.load_file('./fixtures/templates/returnitems.yml').dup
    returnitems['targetWarranty'] = targetWarranty
    return returnitems
  end

  def self.put_targetWarrant_value_10
    returnitems = YAML.load_file('./fixtures/templates/returnitems.yml').dup
    returnitems['targetWarranty'] = 10
    return returnitems
  end

  def self.put_targetWarrant_invalid_valie
    returnitems = YAML.load_file('./fixtures/templates/returnitems.yml').dup
    returnitems['targetWarranty'] = 9999
    return returnitems
  end

end
