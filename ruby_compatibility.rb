# Ruby 3.0+ compatibility patch for tainted? and untaint methods
unless Object.method_defined?(:tainted?)
  class Object
    def tainted?
      false
    end
    
    def untaint
      self
    end
  end
end
