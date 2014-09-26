require 'statesman'

module Renote
  module Fsm
    class ShellMachine

      include Statesman::Machine

      state :pending, initial: true
      state :active
      state :done

      transition from: :pending, to: :active
      transition from: :active, to: :done

      @alive = true
      @output_file = nil

      event :start do
        transition from: :pending, to: :active
      end

      event :finish do
        transition from: :active, to: :done
      end

      guard_transition(from: :pending, to: :active) do
        !@output_file.nil?
      end

      after_transition(to: :active) do
        # TODO: infinite loop of listening for keyboard input until escape key is pressed, then transition.
      end

      after_transition(to: :done) do
        @alive = false
      end

    end
  end
end
