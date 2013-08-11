module Poly
  class Routing
    class << self
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

      def register_routes(page)
        begin
          _routes = Rails.application.routes
          _routes.disable_clear_and_finalize = true
          _routes.clear!
          Rails.application.routes_reloader.paths.each{ |path| load(path) }

          namespace = page.configuration[:route_prefix]
          controller_name = page.controller.controller_name.tableize

          _routes.draw do
            block = %{
              #{"namespace '#{namespace}' do" if namespace.present?}
                #{(page.is_singleton_resource? ? "resource :#{page.configuration[:instance_name].to_sym}" :
                    "resources :#{page.configuration[:collection_name].to_sym}")},
                         only: #{page.controller.actions_list.inspect},
                         controller: '#{controller_name}' do
                  #{
                    if page.configuration[:custom_actions]
                      members = page.configuration[:custom_actions][:resource]
                      collections = page.configuration[:custom_actions][:collection]

                      if members.present?
                        %{
                          member do
                            #{
                              members.each do |action|
                                "match '#{action}', to: '#{controller_name}##{action}', via: :all"
                              end
                            }
                          end
                        }
                      end

                      if collections.present?
                        %{
                          collection do
                            #{
                              collections.each do |action|
                                "match '#{action}', to: '#{controller_name}##{action}', via: :all"
                              end
                            }
                          end
                        }
                      end
                    end
                  }
                end
              #{'end' if namespace.present?}
            }

            eval block
          end
          ActiveSupport.on_load(:action_controller) { _routes.finalize! }
        ensure
          _routes.disable_clear_and_finalize = false
        end
      end
    end
  end
end