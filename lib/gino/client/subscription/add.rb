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
      end
    end
  end
end