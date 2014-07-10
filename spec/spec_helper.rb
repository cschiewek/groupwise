require 'yaml'

RSpec.configure do |config|
   config.add_setting :groupwise_config, 
                      default: YAML.load(File.read('./spec/groupwise_config.yml'))
end
