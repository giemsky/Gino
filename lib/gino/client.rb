require 'gino/client/subscription'
require 'gino/client/repository'

module Gino
  module Client
    ALL = [
      Subscription,
      Repository
    ]
  
    def self.execute(args)
      ALL.each{|e| e.execute(args) }
      abort
    end
    
    def self.abort
      puts "All usage options..."
      Kernel.abort
    end
  end
end