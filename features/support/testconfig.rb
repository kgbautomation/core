require 'yaml'

class TestConfig
  def self.[] key
    @@testconfig[key]
  end

  def self.load name
    @@testconfig = nil
    io = File.open( File.dirname(__FILE__) + "/testconfig.yml" )
    YAML::load_documents(io) { |doc| @@testconfig = doc[name] }
    raise "Could not locate a configuration named \"#{name}\"" unless @@testconfig
  end

  def self.[]= key, value
    @@testconfig[key] = value
  end

end

TestConfig.load('basic')
