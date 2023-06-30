# frozen_string_literal: true

autoload :Tag, "hexlet_code/tag"
require_relative "hexlet_code/version"

# This module provides methods for building HTML
module HexletCode
  class Error < StandardError; end

  def self.form_for(resource, **options)
    builder = FormBuilder.new(resource, **options)
    yield(builder) if block_given?

    builder.render_html
    # Tag.build("form", action: url, method: "post") do
    #   if block_given? && !yield.nil?
    #     # Tag.build(yield)
    #     # yield()
    #   end

    # end
  end
end

# This module provides methods for building form
class FormBuilder
  def initialize(resource, **options)
    puts resource
    puts options
  end

  def input(param)
    puts param
  end
end
