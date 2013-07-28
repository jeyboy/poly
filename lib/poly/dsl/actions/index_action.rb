module Poly
  module Dsl
    module Actions
      class IndexAction < Base
        def initialize &block
          super(block) if block_given?
        end
      end
    end
  end
end