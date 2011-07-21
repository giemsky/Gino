require 'optparse'

module Gino
  module Client
    module Subscription
      module List
        def self.execute(args)
          return unless args.first == 'list'
          
          options = {}
          OptionParser.new do |opts|
            opts.banner = "Usage: gino subscription list [options]"

            opts.on("-u", "--user USER_EMAIL", "Show for user") do |user|
              options[:user] = user
            end
          end.parse!

          subscriptions = Gino::Storage.subscriptions
          subscriptions = subscriptions.select{|s| s.user_email == options[:user]} if options[:user]
          
          puts "Current subscriptions:"
          subscriptions.each do |s|
            puts "#{s.uuid}\t#{s.user_email}"
          end

          exit
        end
      end
    end
  end
end