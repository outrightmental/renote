require 'thor'

module Renote
  module Cli
    class Application < Thor

      desc 'into <FILE>', 'Shell appends keyboard input to <FILE> until ESCAPE key is pressed.'
      def into(target_file_path)
        @shell = new Renote::Fsm::Shell
        @shell.trigger(:load, target_file_path)
      end

    end
  end
end