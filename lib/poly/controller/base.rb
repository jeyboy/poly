module Poly::Controller
  class Base < ::InheritedResources::Base
    attr_accessor :presentations, :default => {}

    #class << self
    #  public :actions
    #end

    def initialize(&block)
      instance_eval(&block) if block_given?
      prepare_default
    end

    def prepare_default
      self.class.send(:actions).each do |action|
        @presentations[action] = "#{action.capitalize}Presentation".constantize.new(self)
      end
    end
  end
end