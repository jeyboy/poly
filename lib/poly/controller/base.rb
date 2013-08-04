module Poly::Controller
  class Base < ::InheritedResources::Base
    attr_accessor :presentations, :default => {}

    class << self
      public :defaults
      public :actions, :custom_actions
      public :belongs_to, :polymorphic_belongs_to, :singleton_belongs_to, :optional_belongs_to
      public :with_role, :without_protection
    end

    def initialize(&block)
      instance_eval(&block) if block_given?
      prepare_default
    end

    def method_missing(name, *args, &block)
      self.class.send name, *args, &block
    end

    #def defaults(options)
    #  self.class.defaults(options)
    #end
    #
    ## Defines which actions will be inherited from the controller.
    ## Syntax is borrowed from resource_controller.
    ##
    ##   actions :index, :show, :edit
    ##   actions :all, :except => :index
    ##
    #def actions(*actions_to_keep)
    #  self.class.actions(actions_to_keep)
    #end
    #
    ## Defines custom restful actions by resource or collection basis.
    ##
    ##   custom_actions :resource => [:delete, :transit], :collection => :search
    #def custom_actions(options)
    #
    #end
    #
    #def respond_to
    #
    #end

    def prepare_default
      #self.class.actions.each do |action|
      #  @presentations[action] = "#{action.capitalize}Presentation".constantize.new(self)
      #end
    end
  end
end