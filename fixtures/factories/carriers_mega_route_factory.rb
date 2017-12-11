class CarriersMegaRoute

  def self.create_mega_route
    mega_route = YAML.load_file('./fixtures/templates/carriers_mega_route.yml')['post_megaroutes'].dup
    mega_route['megaroutes'][0]['id'] = Faker::Number.number(5)
    mega_route['megaroutes'][0]['name'] = Faker::Name.first_name
    mega_route['megaroutes'][0]['externalDelivery'] = Faker::Boolean.boolean
    mega_route['megaroutes'][0]['absenceRegion'] = false
    return mega_route
  end

  def self.updade_mega_route
    mega_route = YAML.load_file('./fixtures/templates/carriers_mega_route.yml')['put_megaroutes'].dup
    mega_route['name'] = Faker::Name.first_name
    mega_route['externalDelivery'] = Faker::Boolean.boolean
    mega_route['absenceRegion'] = Faker::Boolean.boolean
    return mega_route
  end

  def self.create_mega_route_invalid
    mega_route = YAML.load_file('./fixtures/templates/carriers_mega_route.yml')['post_megaroutes_without_id'].dup
    mega_route['megaroutes'][0]['name'] = Faker::Name.first_name
    mega_route['megaroutes'][0]['externalDelivery'] = Faker::Boolean.boolean
    mega_route['megaroutes'][0]['absenceRegion'] = Faker::Boolean.boolean
    return mega_route
  end

  def self.mega_route_without_name
    mega_route = YAML.load_file('./fixtures/templates/carriers_mega_route.yml')['post_mega_route_without_name'].dup
    mega_route['megaroutes'][0]['id'] = Faker::Number.number(5)
    mega_route['megaroutes'][0]['externalDelivery'] = Faker::Boolean.boolean
    mega_route['megaroutes'][0]['absenceRegion'] = Faker::Boolean.boolean
    return mega_route
  end

  def self.mega_route_without_externalDelivery
    mega_route = YAML.load_file('./fixtures/templates/carriers_mega_route.yml')['post_mega_route_without_externalDelivery'].dup
    mega_route['megaroutes'][0]['id'] = Faker::Number.number(5)
    mega_route['megaroutes'][0]['name'] = Faker::Name.first_name
    mega_route['megaroutes'][0]['absenceRegion'] = false
    return mega_route
  end

  def self.mega_route_without_absenceRegion
    mega_route = YAML.load_file('./fixtures/templates/carriers_mega_route.yml')['post_mega_route_without_absenceRegion'].dup
    mega_route['megaroutes'][0]['id'] = Faker::Number.number(5)
    mega_route['megaroutes'][0]['name'] = Faker::Name.first_name
    mega_route['megaroutes'][0]['externalDelivery'] = false
    return mega_route
  end

  def self.mega_route_without_sectionId
    mega_route = YAML.load_file('./fixtures/templates/carriers_mega_route.yml')['post_mega_route_without_sectionId'].dup
    mega_route['megaroutes'][0]['id'] = Faker::Number.number(5)
    mega_route['megaroutes'][0]['name'] = Faker::Name.first_name
    mega_route['megaroutes'][0]['externalDelivery'] = false
    return mega_route
  end
  
end
