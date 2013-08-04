module Poly
  require 'poly/controller/base'

  class Page
    attr_accessor :controller

    delegate :register_controller, :to => 'Construct'

    def initialize(name, args = {}, &block)
       controller_class = register_controller(name, 'Poly::Controller::Base')
       @controller = controller_class.new(&block)
    end
  end
end