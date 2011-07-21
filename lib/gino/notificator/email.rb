require 'mail'

module Gino
  module Notificator
    module Email
      def self.simple(recipients, repository, update)
        template = File.read( File.expand_path(File.dirname(__FILE__) + '/email/simple.erb') )
        commit = repository.grit_repo.commit(update.newrev)
        
        Mail.new do
          from    Gino::Config::EMAIL[:from]
          to      recipients
          subject Gino::Config::EMAIL[:subject]
          body    ERB.new(template).result binding
        end
        
      end
    end
  end
end