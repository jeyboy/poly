module Poly
  module Dsl
    class Routing
      class << self
        def prepare(page)
          register_routes(page)
        end

        private
          def route_name(page)
            if page.defaults[:singleton] == true
              page.instance_name
            end || page.collection_name
          end

          def sym_route_name(page)
            route_name(page).to_sym
          end

          def register_routes(page)
            #custom_actions :resource => :delete, :collection => :search
            resource sym_route_name(page), page.actions

            Rails.application.routes.draw do
              page.custom_actions.each_pair do |relation, action|
                case relation
                  when :resource

                  when :collection

                  else
                    raise Exception.new 'unknown custom action type'
                end
              end
            end
          end
      end
    end
  end
end