module Poly
  class Routing
    class << self
      def register_routes(page)
        begin
          _routes = Rails.application.routes
          _routes.disable_clear_and_finalize = true
          _routes.clear!
          Rails.application.routes_reloader.paths.each{ |path| load(path) }
          _routes.draw do
            if page.is_singleton_resource?

            else

            end
            # here you can add any route you want
            #get "/test#{rand(1000000)}", :to => "sessions#new"

          end
          ActiveSupport.on_load(:action_controller) { _routes.finalize! }
        ensure
          _routes.disable_clear_and_finalize = false
        end



        ##custom_actions :resource => :delete, :collection => :search

        #resource sym_route_name(page), page.actions
        #
        #Rails.application.routes.draw do
        #  page.custom_actions.each_pair do |relation, action|
        #    case relation
        #      when :resource
        #
        #      when :collection
        #
        #      else
        #        raise Exception.new 'unknown custom action type'
        #    end
        #  end
        #end
      end

      #singleton   = page.controller.resources_configuration[:self][:singleton]
      #polymorphic = page.controller.parents_symbols.include?(:polymorphic)
      #actions = page.controller.actions_list
      #custom_actions = page.controller.resources_configuration[:self][:custom_actions]

      #page.controller.resources_configuration[:route_collection_name]
      #page.controller.resources_configuration[:route_instance_name]
      #page.controller.resources_configuration[:instance_name]
      #page.controller.resources_configuration[:collection_name]
      #page.controller.resources_configuration[:route_prefix]
      #page.controller.resources_configuration[:request_name]

      private
        def route_name(page)
          if page.is_singleton_resource?
            page.configuration[:instance_name]
          end || page.configuration[:collection_name]
        end

        def sym_route_name(page)
          route_name(page).to_sym
        end
    end
  end
end