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
  end
end

# This module provides methods for building form
class FormBuilder
  attr_accessor :url, :result, :resource

  def initialize(resource, **options)
    @url = options[:url] || "#"
    @result = Tag.build("form", action: url, method: "post")
    @resource = resource
  end

  def input(param, as: :input)
    @result += if as == :input
                 Tag.build("input", name: param, type: "text", value: resource[param])
               else
                 Tag.build("textarea", name: param, cols: 20, rows: 40) { resource[param] }
               end
  end

  def render_html
    "#{result}</form>"
  end
end
