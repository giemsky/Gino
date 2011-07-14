module Gino
  module Server
    class RackApp
      # Call is the entry point for all rack apps.
      def call(env)
        @req = Rack::Request.new(env)
        @res = Rack::Response.new

        [200, { 'Content-Type' => 'text/html' }, 'hello from rack and webrick']
      end
    end
  end
end