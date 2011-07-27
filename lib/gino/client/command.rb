module Gino
  module Client
    module Command
      
      def register_command(command)
        @commands << command
      end
      
      def usage
        output = ""
        @commands.each{ |command| output << "#{command.usage}\n" }
        output
      end
      
      def execute_subcommand(args)
        @commands.each{|e| e.execute(args) }
        Gino::Client.abort
      end
      
    end
  end
end