module Poly
  module Dsl
    module Controllers
      class Controller < ::InheritedResources::Base
        def initialize
          instance_eval(&block) if block_given?
        end

        #def prepare_default
        #  controller.actions.each do |action|
        #    @views[action] = "#{action.capitalize}Presentation".constantize.new(self)
        #  end
        #end
      end
    end
  end
end