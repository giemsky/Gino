module Gino
  module Client
    module Subscription
      module Add
        def self.execute(args)
          return unless args.first == 'add'

          Gino::Client.abort if args.size != 2
          
          user_mail = args[1]
          
          subscription = Gino::Storage::Subscription.new(user_mail)
          subscription.save

          puts "Subscription added for user #{user_mail}"
          exit
        end
        
        def self.usage
          "Add new subscription\n  gino subscription add USER_EMAIL\n"
        end
        
      end
    end
  end
end