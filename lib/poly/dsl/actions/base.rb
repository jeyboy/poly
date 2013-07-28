module Poly
  module Dsl
    module Actions
      class Base
        def initialize &block
          instance_eval(&block) if block_given?
        end
      end
    end
  end
end