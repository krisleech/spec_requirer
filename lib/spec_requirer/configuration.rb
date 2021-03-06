require 'pathname'

module SpecRequirer
  class Configuration
    class MissingConfiguration < StandardError; end

    attr_accessor :components

    def clear
      @app_root = nil
      @components = nil
    end

    def app_root
      raise MissingConfiguration, 'app_root not set' if @app_root.nil?
      @app_root
    end

    def app_root=(path)
      @app_root = Pathname(path)
    end
  end
end
