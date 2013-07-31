module Poly
  module Dsl
    class Page
      def initialize(name, args = {}, &block)
        register_controller(name)
        instance_eval(&block) if block_given?
      end

      private
        def register_controller(name)
          Construct.register_controller(name, 'Poly::Controller::Base')
        end
    end
  end
end