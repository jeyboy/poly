module Poly
  module View
    module Presentations
      class NewPresentation < Base
        private
          def prepare_default(context)
            div do
              p 'New'
            end
          end
      end
    end
  end
end