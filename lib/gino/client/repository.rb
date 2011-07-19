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
    end
  end
end