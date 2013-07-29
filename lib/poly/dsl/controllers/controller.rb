module Poly
  module Dsl
    module Controllers
      require 'poly/dsl/views'

      class Controller
        cattr_accessor :views
        cattr_accessor :controller

        def initialize(name, args = {}, &block)
          @controller = GenerateController.new(name, args, &block)
          prepare_default
        end

        def prepare_default
          actions.each do |action|
            @views[action] = "#{action.capitalize}Presentation".constantize.new(self)
          end
        end
      end
    end
  end
end