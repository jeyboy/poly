module Poly
  require 'poly/controller/base'

  class Page
    attr_accessor :controller

    delegate :register_controller, :to => 'Construct'

    def initialize(name, args = {}, &block)
      args.stringify_keys!
      @controller = register_controller(
           name,
           'Poly::Controller::Base',
           args['namespace'] || Poly.default_namespace
       ).new(&block)
    end

    def is_singleton_resource?
      configuration[:singleton] == true
    end

    def configuration
      controller.resources_configuration[:self]
    end
  end
end