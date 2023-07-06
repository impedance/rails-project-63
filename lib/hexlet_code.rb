# frozen_string_literal: true

autoload :Tag, "hexlet_code/tag"
autoload :VERSION, "hexlet_code/version"
autoload :FormRender, "hexlet_code/form_render"
autoload :FormBuilder, "hexlet_code/form_builder"

# This module provides methods for building HTML
module HexletCode
  class Error < StandardError; end

  def self.form_for(resource, **options)
    builder = FormBuilder.new(resource, **options)
    yield(builder) if block_given?

    builded_form = builder.close_form
    FormRender.render_html(builded_form)
  end
end
