require 'erb'
require 'uri'
require 'net/http'

module Gino
  module Client
    module Generators
      module GitHook
        def self.generate(repository_name, repository_path, api_url)
          filepath = File.join(repository_path, "hooks/post-receive")
          template = File.read(File.expand_path(File.dirname(__FILE__) + '/git_hook.erb'))
          
          api_uri = URI.parse(api_url)
          api_uri.path = '/' if api_uri.path.empty?
          
          f= File.new(filepath, 'w', 0755)
          f.write ERB.new(template).result binding
          f.close
        end
      end
    end
  end
end