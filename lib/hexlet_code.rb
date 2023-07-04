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

  def input(field_name, **attributes)
    resource.public_send(field_name)

    @result += if attributes[:as] == :text
                 textarea(field_name, attributes)
               else
                 Tag.build("input", name: field_name, type: "text", value: resource[field_name], **attributes)
               end
  end

  def textarea(name, attrs)
    cols = attrs[:cols] || 20
    rows = attrs[:rows] || 40
    Tag.build("textarea", name: name, cols: cols, rows: rows) { resource[name] }
  end

  def render_html
    "#{result}</form>"
  end
end
