module Poly
  require 'poly/controller/base'

  class Page
    attr_accessor :controller

    def initialize(name, args = {}, &block)
       controller_class = register_controller(name, &block)
       @controller = controller_class.new
    end

    private
      def register_controller(name, &block)
        Construct.register_controller2(name, &block)
        #Construct.register_controller(name, 'Poly::Controller::Base')
      end
  end
end