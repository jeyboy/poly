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

    def register_module(name)
      eval "module ::#{name}; end"
    end
  end
end