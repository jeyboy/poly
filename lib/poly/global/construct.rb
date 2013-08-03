class Construct
  class << self
    def register_controller(name, superclass = nil)
      #eval %{
      #  class ::#{name}Controller#{" < #{superclass}" if superclass}
      #  end
      #}
      name = "::#{name.pluralize}Controller"
      eval "class #{name}#{" < #{superclass}" if superclass}\n end"
      name.constantize
    end

    def register_module(name)
      eval "module ::#{name}; end"
    end
  end
end