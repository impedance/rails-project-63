# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'active_support/all'

# This module provides methods for building HTML
module HexletCode
  autoload :FormRender, 'hexlet_code/form_render'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :Tag, 'hexlet_code/tag'
  autoload :TextInput, 'hexlet_code/inputs/text_input'
  autoload :StringInput, 'hexlet_code/inputs/string_input'
  autoload :BaseInput, 'hexlet_code/inputs/base_input'

  class Error < StandardError; end

  def self.form_for(resource, **options)
    builded_form = FormBuilder.new(resource, **options)
    yield(builded_form) if block_given?

    FormRender.render_html(builded_form.form_body)
  end
end
