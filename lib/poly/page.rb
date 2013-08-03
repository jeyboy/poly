module Poly
  require 'poly/controller/base'

  class Page
    attr_accessor :controller

    def initialize(name, args = {}, &block)
      @controller = register_controller(name).new(&block)
    end

    private
      def register_controller(name)
        Construct.register_controller(name, 'Poly::Controller::Base')
      end
  end
end