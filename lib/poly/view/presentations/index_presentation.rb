module Poly
  module View
    module Presentations
      class IndexPresentation < Base
        private
          def prepare_default(context)
            div do
              p 'Index'
            end
          end
      end
    end
  end
end