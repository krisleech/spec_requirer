require 'spec_requirer/version'
require 'spec_requirer/configuration'
require 'spec_requirer/loader'

begin
  require 'pry'
rescue LoadError
end

module SpecRequirer
  def self.setup(config_options = {})
    config_options.each { |k,v| configuration.send("#{k}=", v) }

    Object.include(Loader.new(configuration))
  end

  def self.configuration
    @configuration ||= Configuration.new # TODO: thread-safe...
  end

  def self.configure
    yield(configuration)
  end
end
