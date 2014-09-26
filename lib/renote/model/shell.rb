require 'statesman'

module Renote
  module Model
    class Shell

      delegate :current_state, :trigger!, :available_events, to: :state_machine

      def state_machine
        @state_machine ||= Renote::Fsm::ShellMachine.new(self)
      end

    end
  end
end
