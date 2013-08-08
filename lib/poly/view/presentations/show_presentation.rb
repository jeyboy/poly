module Poly
  module View
    module Presentations
      class ShowPresentation < Base
        private
          def prepare_default(context)
            div do
              p 'Show'
            end
          end
      end
    end
  end
end