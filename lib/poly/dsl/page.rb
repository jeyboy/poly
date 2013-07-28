module Poly
  module Dsl
    require 'inherited_resources'
    #require 'poly/dsl/routing'

    class Page < InheritedResources::Base
      attr_reader :collection_name
      attr_reader :instance_name


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
          @collection_name = name.tableize
          @instance_name = @collection_name.singularize
          defaults :resource_class => args[:resource_class] || name,
                   :collection_name => args[:collection_name] || collection_name,
                   :instance_name => args[:instance_name] || instance_name
        end
    end
  end
end