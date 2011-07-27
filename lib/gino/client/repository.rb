module Gino
  module Client
    module Repository
      extend Command
      
      Gino::Client.register_command(self)
      @commands = []
      
      def self.execute(args)
        return unless args.first == 'repository'
        execute_subcommand(args[1..-1])
      end
      
    end
  end
end

require 'gino/client/repository/add'