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
            register_namespace(page)
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
        def register_namespace(page)
          if page.configuration[:route_prefix]
            namespace page.configuration[:route_prefix] do
              register_resource(page)
            end
          else
            register_resource(page)
          end
        end

        def register_resource(page)
          if page.is_singleton_resource?
            resource page.configuration[:instance_name].to_sym,
                     only: page.controller.actions_list,
                     controller: page.controller.name.tableize do
              register_custom_actions(page)
            end
          else
            resources page.configuration[:collection_name].to_sym,
                      only: page.controller.actions_list,
                      controller: page.controller.name.tableize do
              register_custom_actions(page)
            end
          end
        end

      def register_custom_actions(page)
        members = page.configuration[:custom_actions][:resource]
        collections = page.configuration[:custom_actions][:collection]
        controller_name = page.controller.name.tableize

        if members.present?
          #with id
          member do
            members.each do |action|
              match action, to: "#{controller_name}##{action}", via: :all
            end
          end
        end

        if collections.present?
          #without id
          collection do
            collections.each do |action|
              match action, to: "#{controller_name}##{action}", via: :all
            end
          end
        end
      end
    end
  end
end