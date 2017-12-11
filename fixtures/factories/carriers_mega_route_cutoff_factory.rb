class MegaRoutCutOff
  def self.post_new_cutoffs
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = Time.now.strftime("%R")
    cutoffs['carrierSection'] = Time.at(6000).strftime("%R")
    cutoffs['user'] = Faker::Lorem.characters(5)
    cutoffs['dateTime'] = DateTime.now.strftime("%FT%T")
    return cutoffs
  end

  def self.put_cutoffs
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = Time.now.strftime("%R")
    cutoffs['carrierSection'] = Time.at(6000).strftime("%R")
    cutoffs['user'] = Faker::Lorem.characters(6)
    cutoffs['dateTime'] = DateTime.now.strftime("%FT%T")
    return cutoffs
  end

  def self.post_cutoffs_without_operationsection
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = ""
    cutoffs['carrierSection'] = Time.at(6000).strftime("%R")
    cutoffs['user'] = Faker::Lorem.characters(6)
    cutoffs['dateTime'] = DateTime.now.strftime("%FT%T")
    return cutoffs
  end

  def self.post_cutoffs_without_carriersection
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = Time.now.strftime("%R")
    cutoffs['carrierSection'] = ""
    cutoffs['user'] = Faker::Lorem.characters(6)
    cutoffs['dateTime'] = DateTime.now.strftime("%FT%T")
    return cutoffs
  end

  def self.post_cutoffs_without_user
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = Time.now.strftime("%R")
    cutoffs['carrierSection'] = Time.at(6000).strftime("%R")
    cutoffs['user'] = ""
    cutoffs['dateTime'] = DateTime.now.strftime("%FT%T")
    return cutoffs
  end

  def self.post_cutoffs_without_datetime
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = Time.now.strftime("%R")
    cutoffs['carrierSection'] = Time.at(6000).strftime("%R")
    cutoffs['user'] = Faker::Lorem.characters(6)
    cutoffs['dateTime'] = ""
    return cutoffs
  end

  def self.post_cutoffs_invalid_datetime
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = Time.now.strftime("%R")
    cutoffs['carrierSection'] = Time.at(6000).strftime("%R")
    cutoffs['user'] = Faker::Lorem.characters(6)
    cutoffs['dateTime'] = "2017-02-29T12:22:00"
    return cutoffs
  end

  def self.post_cutoffs_invaid_value_operationsection
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = "abcd"
    cutoffs['carrierSection'] = Time.at(6000).strftime("%R")
    cutoffs['user'] = Faker::Lorem.characters(6)
    cutoffs['dateTime'] = DateTime.now.strftime("%FT%T")
    return cutoffs
  end

  def self.post_cutoffs_invaid_value_carriersection
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = Time.now.strftime("%R")
    cutoffs['carrierSection'] = "abcd"
    cutoffs['user'] = Faker::Lorem.characters(5)
    cutoffs['dateTime'] = DateTime.now.strftime("%FT%T")
    return cutoffs
  end

  def self.post_cutoffs_invaid_value_user
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = Time.now.strftime("%R")
    cutoffs['carrierSection'] = Time.at(6000).strftime("%R")
    cutoffs['user'] = 134357899
    cutoffs['dateTime'] = DateTime.now.strftime("%FT%T")
    return cutoffs
  end

  def self.post_cutoffs_invaid_value_datetime
    cutoffs = YAML.load_file('./fixtures/templates/carriers_mega_route_cutoff.yml')['post_mega_route_cutoff'].dup
    cutoffs['operationSection'] = Time.now.strftime("%R")
    cutoffs['carrierSection'] = Time.at(6000).strftime("%R")
    cutoffs['user'] = Faker::Lorem.characters(6)
    cutoffs['dateTime'] = "abcd"
    return cutoffs
  end
end
