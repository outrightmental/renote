require 'state_machine'
require 'io/console'


module Renote
  module Models
    class Shell
      attr_accessor :output_file_path

      state_machine :state, :initial => :loading do

        before_transition :on => :active do
          if @output_file.nil?
            raise 'Must specify an output file.'
          end
        end

        event :start do
          transition :loading => :active
        end

        event :finish do
          transition :active => :done
        end

        state :loading, :active do
          def alive?
            true
          end
        end

        state :active do
          def run
            c = read_char
            handle_input c if c
          end
        end

        state :done do
          def alive?
            false
          end
        end

      end

      def open(handle)
        set_output_file handle
        start!
      end

      def initialize
        @output_file = nil
        super() # NOTE: This *must* be called, otherwise states won't get initialized
      end

      private

      def set_output_file(handle)
        @output_file = handle
      end

      def handle_input(c)
        if c=="\e"
          finish!
        else
          @output_file.putc c
          putc '.'
        end
      end

      # read a character without pressing enter and without printing to the screen
      def read_char
        begin
          # save previous state of stty
          old_state = `stty -g`
          # disable echoing and enable raw (not having to press enter)
          system "stty raw -echo"
          c = STDIN.getc.chr
          # gather next two characters of special keys
          if c=="\e"
            extra_thread = Thread.new {
              c = c + STDIN.getc.chr
              c = c + STDIN.getc.chr
            }
            # wait just long enough for special keys to get swallowed
            extra_thread.join(0.00001)
            # kill thread so not-so-long special keys don't wait on getc
            extra_thread.kill
          end
        rescue => ex
          puts "#{ex.class}: #{ex.message}"
          puts ex.backtrace
        ensure
          # restore previous state of stty
          system "stty #{old_state}"
        end
        c
      end

    end
  end
end
