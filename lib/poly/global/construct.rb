class Construct
  class << self
    def register_controller(name, superclass = nil, namespace = nil)
      namespace = namespace.titleize
      register_module(namespace) unless Object.const_defined?(namespace)
      name = "::#{[namespace, "#{name.pluralize}Controller"].compact.join('::')}"
      eval %{
        class #{name}#{" < #{superclass}" if superclass}
        end
      }
      name.constantize
    end

    def register_module(name)
      eval "module ::#{name}; end"
    end
  end
end