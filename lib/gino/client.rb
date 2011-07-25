require 'gino/client/subscription'
require 'gino/client/repository'

module Gino
  module Client
    ALL = [
      Subscription,
      Repository
    ]
  
    def self.execute(args)
      opts = Hash.new
      options(opts).parse!
      
      ALL.each{|e| e.execute(args)} if opts.empty?
      
      Kernel.abort Gino::VERSION if opts[:version]
      abort
    end
    
    def self.abort
      output = String.new
      output << usage
      output << ALL.map(&:usage).join
      Kernel.abort output
    end
    
    def self.options(options = {})
      OptionParser.new do |opts|
        opts.on("-h", "--help", "Show help") do
          options[:help] = true
        end
        
        opts.on("-v", "--version", "Show version") do
          options[:version] = true
        end
      end
    end
    
    def self.usage
      "#{options}\n"
    end
    
  end
end