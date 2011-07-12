require 'erb'
require 'uri'
require 'net/http'

module Gino
  module Client
    module Generators
      module GitHook
        def self.generate(repository_name, repository_path, api_url)
          filepath = File.join(repository_path, "hooks/post-receive")
          template = File.expand_path(File.read(File.dirname(__FILE__) + '/git_hook.erb'))
          File.open(filepath, 'w') do |f| 
            f.write ERB.new(template).result binding
          end
        end
      end
    end
  end
end