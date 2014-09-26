require 'thor'

module Renote
  module Cli
    class Application < Thor

      desc 'into <FILE>', 'Shell appends keyboard input to <FILE> until ESCAPE key is pressed.'
      def into(target_file_path)
        @shell = Renote::Model::Shell.new
        @shell.trigger!(:start, target_file_path)
      end

    end
  end
end