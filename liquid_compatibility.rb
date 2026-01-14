# Liquid gem compatibility patch for Ruby 3.0+ which removed tainted? method

# Check if we're in Ruby 3.0+ which doesn't have tainted? method
if RUBY_VERSION >= '3.0.0'
  # Use refine to add tainted? and untaint methods only where needed
  module LiquidCompatibility
    refine Object do
      def tainted?
        false
      end
      
      def untaint
        self
      end
    end
  end
  
  # Apply the refinement globally
  using LiquidCompatibility
end
