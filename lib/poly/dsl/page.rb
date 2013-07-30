module Poly
  module Dsl
    #require 'poly/dsl/controllers'

    class Page
      def initialize(name, args = {}, &block)
        #@controller = Controllers::Controller.new(name, args, &block)
        instance_eval(&block) if block_given?
      end

      def register_controller(name)
        eval "class ::#{name}Controller < Poly::Dsl::Controllers::Controller; end"
      end

      def register_module
        eval "module ::#{module_name}; end"
      end
    end
  end
end