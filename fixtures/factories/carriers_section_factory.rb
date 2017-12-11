class CarriersSection

  def self.post_section_one
    sections = YAML.load_file('./fixtures/templates/carriers_section.yml')['create_section_one'].dup
    sections['sections'][0]['sectionCode'] = "QA"+Faker::Number.number(3)
    sections['sections'][0]['name'] = "QATEST"+Faker::Number.number(3)
    return sections
  end

  def self.post_section_two
    sections = YAML.load_file('./fixtures/templates/carriers_section.yml')['create_section_two'].dup
    sections['sections'][0]['sectionCode'] = "QA"+Faker::Number.number(3)
    sections['sections'][0]['name'] = "QATEST"+Faker::Number.number(3)
    sections['sections'][1]['sectionCode'] = "QA"+Faker::Number.number(3)
    sections['sections'][1]['name'] = "QATEST"+Faker::Number.number(3)
    return sections
  end

  def self.update_section
    sections = YAML.load_file('./fixtures/templates/carriers_section.yml')['update_section'].dup
    sections['name'] = "TESTQA"+Faker::Number.number(3)
    return sections
  end

  def self.post_invalid_sectioncode
    sections = YAML.load_file('./fixtures/templates/carriers_section.yml')['create_section_one'].dup
    sections['sections'][0]['sectionCode'] = ""
    sections['sections'][0]['name'] = "QATEST"+Faker::Number.number(3)
    return sections
  end

  def self.post_invalid_name
    sections = YAML.load_file('./fixtures/templates/carriers_section.yml')['create_section_one'].dup
    sections['sections'][0]['sectionCode'] = "QA"+Faker::Number.number(3)
    sections['sections'][0]['name'] = ""
    return sections
  end

  def self.update_section_invalid
    sections = YAML.load_file('./fixtures/templates/carriers_section.yml')['update_section'].dup
    sections['name'] = ""
    return sections
  end

  def self.post_section_duplicate
    sections = YAML.load_file('./fixtures/templates/carriers_section.yml')['create_section_one'].dup
    sections['sections'][0]['sectionCode'] = "QA001"
    sections['sections'][0]['name'] = "Aldebaran 001"
    return sections
  end
  
  def self.post_section_charecters_allowed_above
    sections = YAML.load_file('./fixtures/templates/carriers_section.yml')['create_section_one'].dup
    sections['sections'][0]['sectionCode'] = "QA001QWERTYUIOPASDFGHHJKKMZXCVBNM"
    sections['sections'][0]['name'] = "Aldebaran 001"
    return sections
  end
end
