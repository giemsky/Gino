require 'gino/storage/repository'
require 'gino/storage/update'
require 'gino/storage/subscription'
require 'pstore'
require 'json'
require 'fileutils'

module Gino
  module Storage
    extend self
  
    STORE_PATH = ENV["HOME"] + "/.gino"
    DB_FILE = STORE_PATH + "/repositories"
        
    FileUtils.mkdir_p(STORE_PATH)
    File.delete(DB_FILE) if defined?(TEST) && File.exists?(DB_FILE)
    @pstore = PStore.new(DB_FILE)
    
    @pstore.transaction do
      @pstore[:repositories] ||= Hash.new
      @pstore[:subscriptions] ||= Hash.new
    end
    
    def find_repository(uuid)
      @pstore.transaction(true) do
        @pstore[:repositories][uuid]
      end
    end
    
    def save_repository(repository)
      @pstore.transaction do 
        @pstore[:repositories][repository.uuid] = repository
      end
      create_dump
    end
    
    def repositories
      @pstore.transaction(true) do
        @pstore[:repositories].values
      end
    end
    
    def subscriptions
      @pstore.transaction(true) do
        @pstore[:subscriptions].values
      end
    end
    
    def save_subscription(subscription)
      @pstore.transaction do 
        @pstore[:subscriptions][subscription.uuid] = subscription
      end
      create_dump
    end
    
    def remove_subscription(subscription)
      @pstore.transaction do 
        @pstore[:subscriptions].delete(subscription.uuid)
      end
      create_dump
    end
    
    def find_subscription(uuid)
      @pstore.transaction(true) do
        @pstore[:subscriptions][uuid]
      end
    end
    
    def to_json
      output = Hash.new
      @pstore.transaction(true) do
        @pstore.roots.each do |name|
          output[name] = @pstore[name]
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