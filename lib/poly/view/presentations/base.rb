module Poly
  module View
    module Presentations
      require 'poly/dsl/html'
      class Base < ::Poly::Dsl::Html::HtmlBlock
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