module Poly
  module Dsl
    require 'poly/dsl/controllers'

    class Page
      cattr_accessor :controller

      def initialize(name, args = {}, &block)
        @controller = Controllers::Controller.new(name, args, &block)
        instance_eval(&block) if block_given?
        #Routing.register_routes(self)
      end


    end
  end
end