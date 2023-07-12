# frozen_string_literal: true

require_relative 'hexlet_code/version'
autoload :Tag, 'hexlet_code/tag'
autoload :FormRender, 'hexlet_code/form_render'
autoload :FormBuilder, 'hexlet_code/form_builder'

# This module provides methods for building HTML
module HexletCode
  class Error < StandardError; end

  def self.form_for(resource, **options)
    builded_form = FormBuilder.new(resource, **options)
    yield(builded_form) if block_given?

    FormRender.render_html(builded_form.form_body)
  end
end
