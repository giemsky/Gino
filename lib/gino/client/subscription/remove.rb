module Gino
  module Client
    module Subscription
      module Remove
        Gino::Client::Subscription.register_command(self)
        
        def self.execute(args)
          return unless args.first == 'remove'
          
          Gino::Client.abort if args.size != 2
          
          uuid = args[1]
          
          subscription = Gino::Storage.find_subscription(uuid)
          abort "Could't find subscription" unless subscription
          
          Gino::Storage.remove_subscription(subscription)
          puts "Subscription removed for user #{subscription.user_email}" 
          exit
        end
        
        def self.usage
          "Remove subscription\n  gino subscription remove ID\n"
        end
        
      end
    end
  end
end