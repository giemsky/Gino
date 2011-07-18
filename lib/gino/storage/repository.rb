require 'uuidtools'

module Gino
  module Storage
    class Repository
      attr_accessor :name, :path, :updates
      attr_reader :uuid
      
      def initialize(name, path)
        @name = name
        @path = path
        @updates = Array.new
      end
      
      def ==(compared_obj)
        case compared_obj
        when String
          uuid == compared_obj
        when Repository
          uuid == compared_obj.uuid
        else
          false
        end
      end
      
      def self.find(uuid)
        Gino::Storage.find_repository(uuid)
      end
      
      def <<(new_update)
        updates << new_update
      end
      
      def save
        generate_uuid if new_record?
        Gino::Storage.save_repository(self)
      end
      
      def new_record?
        !uuid
      end
      
      def to_json(*a)
        {
          :name => name,
          :path => path,
          :updates => updates
        }.to_json
      end
      
      private

      def generate_uuid
        @uuid = UUIDTools::UUID.timestamp_create
      end
    end
  end
end