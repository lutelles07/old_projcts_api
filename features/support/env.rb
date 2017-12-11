require 'rspec'
require 'pry'
require 'httparty'
require 'hash_compare'
require 'hash_diff'
require 'oci8'
require 'cucumber'
require 'cpf_faker'
require 'faker'
require 'savon'
require 'bunny'
require 'json-schema'


# loads factories
require_relative "../../fixtures/factories/create_instances_factory.rb"
require_relative "../../fixtures/factories/b2bcontracts_factory.rb"
require_relative "../../fixtures/factories/carriers_mega_route_factory.rb"
require_relative "../../fixtures/factories/carriers_mega_route_cutoff_factory.rb"
require_relative "../../fixtures/factories/carriers_section_factory.rb"
require_relative "../../fixtures/factories/returnitems_factory.rb"
require_relative "../../fixtures/factories/create_b2bpartners_factory.rb"
require_relative "../../fixtures/factories/update_b2bpartners_factory.rb"
require_relative "../../fixtures/factories/b2bpartner_invoices_factory.rb"
require_relative "../../fixtures/factories/carriers_factory.rb"
require_relative "../../fixtures/factories/carriers_contracts.rb"
require_relative "../../fixtures/factories/carriers_contracts_regions.rb"
require_relative "../../fixtures/factories/update_carriers_contracts_regions.rb"
require_relative "../../fixtures/factories/carriers_contracts_zipcodes.rb"


# enables https calls
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
HTTParty::Basement.default_options.update(verify: false)

# Environment definitions
DEBUG = ENV['DEBUG'] || false
ENV['ENV'] = 'qa' unless ENV.has_key?'ENV'

# loads configurations
ENVIRONMENT = (YAML.load_file('./config/environment.yml'))[ENV['ENV']]
AUTH = (YAML.load_file('./config/authentication.yml'))[ENV['ENV']]
DEFAULT_DATA = YAML.load_file('./fixtures/default_data.yml')[ENV['ENV']]

# DataBase config
DATABASE = YAML.load_file('config/database.yml')
$database = DATABASE[ENV['ENV']]
