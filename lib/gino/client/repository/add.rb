module Gino
  module Client
    module Repository
      module Add
        def self.execute(args)
          return unless args.first == 'add'
          
          Gino::Client.abort if args.size != 4
          
          name = args[1]
          path = File.expand_path(args[2])
          api_url = args[3]

          abort "Invalid path" unless File.directory?(path)

          repository = Gino::Storage::Repository.new(name, path)
          repository.save
          Gino::Generators::GitHook.generate(repository.uuid, repository.path, api_url)

          puts "Git hook generated in #{path}"
          exit
        end
      end
    end
  end
end