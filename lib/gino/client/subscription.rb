module Gino
  module Client
    module Subscription
      extend Command
      
      Gino::Client.register_command(self)
      @commands = []
      
      def self.execute(args)
        return unless args.first == 'subscription'
        execute_subcommand(args[1..-1])
      end
      
    end
  end
end

require 'gino/client/subscription/add'
require 'gino/client/subscription/list'
require 'gino/client/subscription/remove'