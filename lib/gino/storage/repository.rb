module Gino
  module Storage
    class Repository
      attr_accessor :name, :path, :updates
      
      def initialize(name, path)
        @name = name
        @path = path
        @updates = Array.new
      end
      
      def ==(other_repository)
        @name == other_repository.name && 
          @path == other_repository.path &&
          @updates == other_repository.updates
      end
      
      def self.find(name)
        Gino::Storage.find_repository(name)
      end
      
      def <<(new_update)
        @updates << new_update
      end
      
      def save
        Gino::Storage.save_repository(self)
      end
      
      def to_json(*a)
        {
          :name => @name,
          :path => @path,
          :updates => @updates
        }.to_json
      end
    end
  end
end