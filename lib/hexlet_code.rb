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
  attr_accessor :url, :result

  def initialize(_resource, **_options)
    @url = "#"
    @result = Tag.build("form", action: url, method: "post")
  end

  def input(param)
    @result += Tag.build("input", name: "name")
  end

  def render_html
    "#{result}</form>"
  end
end
