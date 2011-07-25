require 'gino/client/subscription/add'
require 'gino/client/subscription/list'
require 'gino/client/subscription/remove'

module Gino
  module Client
    module Subscription
      ALL = [
        Add,
        List,
        Remove
      ]
      
      def self.execute(args)
        return unless args.first == 'subscription'
        ALL.each{|e| e.execute(args[1..-1]) }
        Gino::Client.abort
      end
      
      def self.usage
        ALL.inject("") do |output, command|
          output << "#{command.usage}\n"
        end
      end
      
    end
  end
end