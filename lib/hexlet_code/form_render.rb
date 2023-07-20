# frozen_string_literal: true

# Rendering form module
module HexletCode
  module FormRender
    def self.render_html(form)
      result = form[:inputs].map { |input| build_input(input) }

      submit_options = form[:submit][:options]
      submit_tag = submit_options ? HexletCode::Tag.build('input', submit_options) : ''
      HexletCode::Tag.build('form', form[:form_options]) do
        result.join + submit_tag
      end
    end

    def self.build_input(input)
      klass_name = "HexletCode::#{input[:type].capitalize}Input"
      klass = klass_name.constantize
      input = klass.new(input[:resource], input[:field_name], input[:attributes])
      input.render
    end
  end
end
