#!/usr/bin/env ruby

# Full compatibility patch for running Jekyll on Ruby 3.0+

# Add missing tainted? and untaint methods to all objects
unless Object.method_defined?(:tainted?)
  class Object
    def tainted?
      false
    end
    
    def untaint
      self
    end
    
    def trust
      self
    end
    
    def untrust
      self
    end
    
    def untrusted?
      false
    end
    
    def trusted?
      true
    end
  end
end

# Add missing methods to String class
unless String.method_defined?(:to_s)
  class String
    def to_s
      self
    end
  end
end

# Add missing methods to Numeric class
unless Numeric.method_defined?(:to_i)
  class Numeric
    def to_i
      self.to_int
    end
  end
end

# Add missing methods to Array class
unless Array.method_defined?(:to_a)
  class Array
    def to_a
      self
    end
  end
end

# Add missing methods to Hash class
unless Hash.method_defined?(:to_h)
  class Hash
    def to_h
      self
    end
  end
end

# Add missing CSV class if needed
begin
  require 'csv'
rescue LoadError
  puts "Warning: CSV library not found, but Jekyll might still work"
end

# Add missing BigDecimal class if needed
begin
  require 'bigdecimal'
rescue LoadError
  puts "Warning: BigDecimal library not found, but Jekyll might still work"
end
