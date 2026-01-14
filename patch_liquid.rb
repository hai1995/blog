#!/usr/bin/env ruby

# Script to patch Liquid gem for Ruby 3.0+ compatibility
require 'bundler'
Bundler.setup

# Find the liquid gem path
liquid_gem_path = Gem::Specification.find_by_name('liquid').gem_dir
variable_rb_path = File.join(liquid_gem_path, 'lib', 'liquid', 'variable.rb')

puts "Patching Liquid gem at #{liquid_gem_path}"

# Read the current content
content = File.read(variable_rb_path)

# Patch the taint_check method
patched_content = content.gsub(
  /def taint_check\(context, obj\)
      return unless obj\.tainted?
      return if Template\.taint_mode == :lax/, 
  <<~'PATCH'
def taint_check(context, obj)
      return unless obj.respond_to?(:tainted?) && obj.tainted?
      return if Template.taint_mode == :lax
PATCH
)

# Write the patched content back to the file
File.write(variable_rb_path, patched_content)

puts "Successfully patched Liquid gem for Ruby 3.0+ compatibility"
