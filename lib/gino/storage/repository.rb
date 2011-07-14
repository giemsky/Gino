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
      
      def as_json(*a)
        {
          :name => @name.to_json(*a),
          :path => @path.to_json(*a),
          :updates => @updates.to_json(*a)
        }
      end
    end
  end
end