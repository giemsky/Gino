require 'gino/client/repository/add'

module Gino
  module Client
    module Repository
      ALL = [
        Add
      ]
      
      def self.execute(args)
        return unless args.first == 'repository'
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