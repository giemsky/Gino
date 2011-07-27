module Gino
  module Client
    module Command
      
      def register_command(command)
        @commands << command
      end
      
      def usage
        @commands.inject("") do |output, command|
          output << "#{command.usage}\n"
        end
      end
      
      def execute_subcommand(args)
        @commands.each{|e| e.execute(args) }
        Gino::Client.abort
      end
      
    end
  end
end