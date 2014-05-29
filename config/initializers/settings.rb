require 'yaml'
require 'erb'
require 'ostruct'
 
class Settings < OpenStruct
  def initialize(config_file_base_name = 'marias-bilder')
    super(YAML.load(ERB.new(File.read(Rails.root.join("config", "#{config_file_base_name}.yml"))).result))
  end
end