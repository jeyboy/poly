class Construct
  class << self
    def register_controller(name, superclass = nil)
      name = "::#{name.pluralize}Controller"
      eval %{
        class #{name}#{" < #{superclass}" if superclass}
        end
      }

      #eval "class #{name}#{" < #{superclass}" if superclass}\n end"
      name.constantize
    end

    def register_controller2(name, &block)
      require 'poly/controller/base'
      name = "::#{name.pluralize}Controller"
      Object::const_set(name.intern, Class::new(Poly::Controller::Base) do
        self.resource_class = name
        inherit_resources
        yield self if block_given?
      end)
    end



    def register_module(name)
      eval "module ::#{name}; end"
    end
  end
end