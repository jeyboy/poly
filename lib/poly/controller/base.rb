module Poly::Controller
  require 'poly/controller/content_for_extender'
  require 'poly/controller/pagination_extender'
  require 'poly/controller/actions_extender'
  require 'poly/view/presentations'

  class Base < ::InheritedResources::Base
    include ContentForExtender
    include PaginationExtender
    include ActionsExtender

    layout :poly

    attr_accessor :presentations
    attr_accessor :pagination_on
    attr_reader :actions_list

    class << self
      public :defaults
      public :actions, :custom_actions
      public :belongs_to, :polymorphic_belongs_to, :singleton_belongs_to, :optional_belongs_to
      public :with_role, :without_protection
    end

    def initialize(&block)
      instance_eval(&block) if block_given?
      prepare_views
    end

    def method_missing(name, *args, &block)
      self.class.send(name, *args, &block)
    end

    def configuration
      resources_configuration[:self]
    end

    protected
      def prepare_views
        @presentations = {}
        prepared_actions.each do |action|
          @presentations[action] = "::Poly::View::Presentations::#{action.capitalize}Presentation".constantize.new(self)
        end
      end

      def prepared_actions
        @actions_list = []

        ::InheritedResources::ACTIONS.each do |action|
          @actions_list << action if self.respond_to?(action)
        end

        excepted_actions = [:create, :update, :destroy]
        @actions_list.reject {|a| excepted_actions.include?(a) }
      end
  end
end