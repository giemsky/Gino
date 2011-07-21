require 'uuidtools'

module Gino
  module Storage
    class Subscription
      extend Enumerable
      
      attr_accessor :user_email
      attr_reader :uuid

      def initialize(user_email)
        @user_email = user_email
      end
      
      def self.each
        Gino::Storage.subscriptions.each{ |s| yield s }
      end
      
      def ==(compared_obj)
        return false unless compared_obj.is_a?(Gino::Storage::Subscription)
        uuid == compared_obj.uuid
      end
      
      def save
        generate_uuid if new_record?
        Gino::Storage.save_subscription(self)
      end
      
      def new_record?
        !uuid
      end
      
      def to_json(*a)
        {
          :user_email => user_email
        }.to_json
      end
      
      private
    
      def generate_uuid
        @uuid = UUIDTools::UUID.timestamp_create.to_s
      end
      
    end
  end
end