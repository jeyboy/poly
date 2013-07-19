module Poly
  module Dsl
    module Views

      #ActionView::Renderer
      #ActionView::Helpers::RenderingHelper
      #ActionView::Base
      class Base < AbstractController::Base
        include AbstractController::Rendering
        include AbstractController::Helpers
        include AbstractController::Translation
        include AbstractController::AssetPaths
        #include Rails.application.routes.url_helpers
        self.view_paths = 'app/views'
        #include AbstractController::Rendering
        #include ActionView::Helpers

        def initialize &block
          instance_eval(&block) if block_given?
        end

        #def _routes
        #  @routes ||= Rails.application.routes rescue ActionDispatch::Routing::RouteSet.new
        #end

        #def method_missing(name, *args, &block)
        #  #if name.to_s =~ /path|url/
        #  #  Rails.application.routes.url_helpers.send(name, args, &block)
        #  #end
        #
        #  #instance_variable_set("@#{name}".to_sym, args[0])
        #  #self.class.send(:define_method, name, proc { instance_variable_get("@#{name}")})
        #end
      end
    end
  end
end