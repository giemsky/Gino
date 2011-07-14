require 'gino/storage/repository'
require 'gino/storage/update'
require 'pstore'
require 'json'
require 'fileutils'

module Gino
  module Storage
    extend self
  
    STORE_PATH = ENV["HOME"] + "/.gino"
        
    FileUtils.mkdir_p(STORE_PATH) unless File.directory?(STORE_PATH)
    @pstore = PStore.new(STORE_PATH + "/repositories")
    
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
    
    def to_json
      output = Array.new
      @pstore.transaction(true) do
        @pstore.roots.each do |name|
          output << @pstore[name]
        end
      end

      output.to_json
    end
    
    def create_dump
      File.open(STORE_PATH + '/dump.json', 'w') do |f|
        f.write to_json
      end
    end
  end
end