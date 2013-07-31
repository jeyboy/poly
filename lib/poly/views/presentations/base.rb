module Poly
  module Dsl
    module Presentations
      class Base < Views::View
        def initialize(context, &block)
          if block_given?
            super(context, &block)
            #instance_eval(&block)
          else
            prepare_default(context)
          end
        end

        private
          def prepare_default(context)
            raise Exception.new 'block needed'
          end
      end
    end
  end
end