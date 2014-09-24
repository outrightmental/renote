require 'thor'

module Renote
  module Cli
    class Application < Thor

      desc 'thru INFILE OUTFILE', 'Pass-through note taking records keyboard input to <OUTFILE> while synchronously displaying contents of <INFILE>.'
      def thru(infile,outfile)
        puts "IN #{infile}"
        puts "OUT #{outfile}"
      end

    end
  end
end