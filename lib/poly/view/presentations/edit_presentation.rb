module Poly
  module View
    module Presentations
      class EditPresentation < Base
        private
          def prepare_default(context)
            div do
              p 'Edit'
            end
          end
      end
    end
  end
end