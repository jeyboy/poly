module Poly::Controller
  class Base < ::InheritedResources::Base
    attr_accessor :presentations, :default => {}

    def initialize(&block)
      instance_eval(&block) if block_given?
      prepare_default
    end

    def prepare_default
      actions.each do |action|
        @presentations[action] = "#{action.capitalize}Presentation".constantize.new(self)
      end
    end
  end
end