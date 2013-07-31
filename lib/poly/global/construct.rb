class Construct
  class << self
    def register_controller(name, superclass = nil)
      eval "class ::#{name}Controller#{" < #{superclass}" if superclass}; end"
    end

    def register_module(name)
      eval "module ::#{name}; end"
    end
  end
end