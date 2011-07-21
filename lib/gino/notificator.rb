require 'gino/notificator/email'

module Gino
  module Notificator
    def self.notify(repository, update)
      recipients = Gino::Storage.subscriptions.map(&:user_email)
      
      mail = Email.simple(recipients, repository, update)
      mail.delivery_method Gino::Config::EMAIL[:delivery_method].to_sym, 
                           Gino::Config::EMAIL[:config]
                           
      mail.deliver!
    end
  end
end