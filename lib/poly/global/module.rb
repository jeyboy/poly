class Module
  def attr_accessor(*methods)
    options = methods.last.is_a?(Hash)? methods.pop: {}
    methods.each do |method|
      raise TypeError.new('method name is not symbol') unless method.is_a?(Symbol)
      define_method(method) do
        instance_variable_get("@#{method}") ||
            instance_variable_set("@#{method}", options[:default])
      end
      define_method("#{method}=") do |v|
        instance_variable_set("@#{method}", v)
      end
    end
  end
end