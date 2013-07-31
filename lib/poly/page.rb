module Poly
  module Dsl
    class Page
      attr_accessor :controller

      def create(name, args = {}, &block)
        @controller = register_controller(name).new(args, &block)
      end

      private
        def register_controller(name)
          Construct.register_controller(name, 'Poly::Controller::Base')
        end
    end
  end
end