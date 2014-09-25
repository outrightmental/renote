module Renote
  module Fsm
    class Machine

      include Statesman::Machine

      state :pending, initial: true
      state :active
      state :done

      transition from: :pending, to: :active
      transition from: :active, to: :done

      @alive = true

      guard_transition(from: pending, to: :working) do
        # TODO: return whether @output_file is connected
        true
      end

      after_transition(to: :working) do
        # TODO: infinite loop of listening for keyboard input until escape key is pressed, then transition.
      end

      after_transition(to: :done) do
        @alive = false
      end

=begin
# keeping this for now as an example use of the statesman gem

      guard_transition(to: :checking_out) do |order|
        # order.products_in_stock?
      end

      before_transition(from: :checking_out, to: :cancelled) do |order, transition|
        # order.reallocate_stock
      end

      before_transition(to: :purchased) do |order, transition|
        # PaymentService.new(order).submit
      end

      after_transition(to: :purchased) do |order, transition|
        # MailerService.order_confirmation(order).deliver
      end
=end

    end
  end
end
