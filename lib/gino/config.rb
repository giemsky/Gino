require 'yaml'

module Gino
  module Config
    file = ENV["HOME"] + "/.ginorc"
    
    abort "No configuration file: #{file}" unless File.exists?(file)
    config = YAML::load_file(file)
    
    SERVER = {
      :port => 9001, 
      :host => 'localhost'
    }.merge(config[:server])
    
    EMAIL = config[:email]
  end
end