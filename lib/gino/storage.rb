require 'gino/storage/repository'
require 'gino/storage/update'
require 'pstore'
require 'json'

module Gino
  module Storage
    extend self
    
    @pstore = PStore.new("data/repositories")
    
    def find_repository(name)
      @pstore.transaction(true) do
        @pstore[name]
      end
    end
    
    def save_repository(repository)
      @pstore.transaction do 
        @pstore[repository.name] = repository
      end
      create_dump
    end
    
    def as_json(*a)
      output = Array.new
      @pstore.transaction(true) do
        @pstore.roots.each do |name|
          output << @pstore[name].to_json(*a)
        end
      end
      output.to_json(*a)
    end
    
    def create_dump
      File.open(File.expand_path(File.dirname(__FILE__) + '/data/dump.json'), 'w') do |f|
        f.write to_json
      end
    end
  end
end