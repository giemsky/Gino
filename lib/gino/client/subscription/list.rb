require 'optparse'

module Gino
  module Client
    module Subscription
      module List
        def self.execute(args)
          return unless args.first == 'list'
          
          opts = Hash.new
          options(opts).parse!

          subscriptions = Gino::Storage.subscriptions
          subscriptions = subscriptions.select{|s| s.user_email == opts[:user]} if opts[:user]
          
          puts "Current subscriptions:"
          subscriptions.each do |s|
            puts "#{s.uuid}\t#{s.user_email}"
          end

          exit
        end
        
        def self.options(options = {})
          OptionParser.new do |opts|
            opts.banner = "  gino subscription list [options]"

            opts.on("-u", "--user USER_EMAIL", "Show for user") do |user|
              options[:user] = user
            end
          end
        end
        
        def self.usage
          "List subscriptions\n#{options}\n"
        end
        
      end
    end
  end
end