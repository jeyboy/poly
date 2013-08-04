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
  end
end