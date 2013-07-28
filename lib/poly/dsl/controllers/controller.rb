module Poly
  module Dsl
    module Controllers
      require 'poly/dsl/views'

      class Controller < Base
        cattr_accessor :views

        def initialize(name, args = {}, &block)
          super(name, args, &block)
          instance_eval(&block) if block_given?
        end

        def prepare_default
          actions.each do |action|
            @views[action] = "#{action.capitalize}Presentation".constantize.new
          end
        end
      end
    end
  end
end