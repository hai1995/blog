# Compatibility patch for Ruby 3.0+ which removed tainted? method
[Object, String, Numeric, Array, Hash, Symbol].each do |klass|
  unless klass.method_defined?(:tainted?)
    klass.class_eval do
      def tainted?
        false
      end
      
      def untaint
        self
      end
    end
  end
end
