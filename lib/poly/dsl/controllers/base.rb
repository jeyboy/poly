module Poly
  module Dsl
    module Controllers

      class Base# < ::InheritedResources::Base
        attr_reader :collection_name
        attr_reader :instance_name
        attr_accessor :namespace
        attr_accessor :pagination_on


        #respond_to :html, :xml, :json
        #respond_to :js, :only => :create
        #respond_to :iphone, :except => [ :edit, :update ]

        #actions :index, :show, :new, :create
        #actions :all, :except => [ :edit, :update, :destroy ]

        #defaults :resource_class => User, :collection_name => 'users', :instance_name => 'user'
        #defaults :route_prefix => 'admin'

        #create!(:notice => "Dude! Nice job creating that project.") { root_url }

        def initialize(name, args = {}, &block)
          super
          instance_eval(&block) if block_given?
          init(name, args)
          #Routing.register_routes(self)
        end

        private

        def init(name, args)
          @collection_name = args[:collection_name] || name.tableize
          @instance_name = args[:instance_name] || collection_name.singularize
          @pagination_on = args[:pagination_on] || pagination_on
          @namespace = args[:namespace] || Poly.default_namespace

          defaults :resource_class => args[:resource_class] || name,
                   :collection_name => collection_name,
                   :instance_name =>  instance_name,
                   :route_prefix => namespace,
                   :route_collection_name => args[:route_collection_name] || collection_name,
                   :route_instance_name => args[:route_instance_name] || instance_name
        end

        protected
          def collection
            if pagination_on
              instance_variable_set "@#{collection_name}".to_sym, end_of_association_chain.paginate(:page => params[:page])
            end || super
          end
      end
    end
  end
end