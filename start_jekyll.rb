#!/usr/bin/env ruby

# Apply compatibility patch for Ruby 3.0+ before loading any gems
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

# Now load and run Jekyll
require 'bundler'
Bundler.require

# Start Jekyll serve
require 'jekyll/commands/serve'
Jekyll::Commands::Serve.process(['--host', 'localhost', '--port', '4000'])
