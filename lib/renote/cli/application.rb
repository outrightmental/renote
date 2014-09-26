require 'thor'

module Renote
  module Cli
    class Application < Thor

      desc 'into <FILE>', 'Shell appends keyboard input to <FILE> until ESCAPE key is pressed.'
      def into(target_file_path)
        @shell = Renote::Models::Shell.new
        open(target_file_path, 'a') { |handle|
          @shell.open handle
          while @shell.alive?
            @shell.run
          end
        }
        puts ''
      end

    end
  end
end