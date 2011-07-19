module Gino
  module Server
    class RackApp
      
      # Save given update
      def handle_request
        update = @req.POST

        repository = Gino::Storage::Repository.find(update["repository_uuid"])

        unless repository
          @res.body =  "Repository is missing"
          @res.status = 404
          return 
        else
          @res.body = "Update saved"
        end
        
        update = Gino::Storage::Update.new(update["oldrev"], update["newrev"], update["refname"])
        
        repository << update
        repository.save
      end
        
      # Call is the entry point for all rack apps.
      def call(env)
        @req = Rack::Request.new(env)
        @res = Rack::Response.new
        
        handle_request

        @res.finish
      end
      
    end
  end
end