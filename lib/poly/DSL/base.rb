module DSL
  class Base
    def initialize &block
      instance_eval &block
    end

    def method_missing name, *args, &block
      instance_variable_set("@#{name}".to_sym, args[0])
      self.class.send(:define_method, name, proc { instance_variable_get("@#{name}")})
    end
  end
end