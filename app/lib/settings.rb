require 'yaml'
require 'erb'
require 'ostruct'
 
class Settings < OpenStruct
  def initialize(path = 'marias-bilder')
    path = Rails.root.join("config", "#{path}.yml")
    if File.exist? path
      super(YAML.load(ERB.new(File.read(path)).result))
    end
  end
  
  def get(key)
    parts = key.split('.')
    env = ENV[parts.join('_').upcase]
    env or send(parts[0])[parts[1]]
  end
  
  def self.get(key)
    self.new.get(key)
  end
end