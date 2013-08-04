module Poly
  require 'poly/controller/base'

  class Page
    attr_accessor :controller

    delegate :register_controller, :to => 'Construct'

    def initialize(name, args = {}, &block)
       controller_class = register_controller(name, 'Poly::Controller::Base')
       @controller = controller_class.new(&block)
    end

    #private
    #  def register_controller(name)
    #    Construct.register_controller(name)
    #    #Construct.register_controller(name, 'Poly::Controller::Base')
    #  end
  end
end