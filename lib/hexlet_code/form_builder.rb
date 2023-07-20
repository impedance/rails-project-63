# frozen_string_literal: true

# This module provides methods for building HTML
module HexletCode
  class FormBuilder
    attr_accessor :resource, :form_body

    def initialize(resource, **options)
      @resource = resource
      action = options.fetch(:url, '#')
      @form_body = {
        inputs: [],
        submit: { options: nil },
        form_options: { action:, method: 'post' }.merge(options.except(:url))
      }
    end

    def input(field_name, **attributes)
      resource.public_send(field_name)

      input_attrs = { type: attributes[:as] || :string, resource:, field_name:, attributes: }
      @form_body[:inputs] << input_attrs
    end

    def submit(value = 'Save')
      @form_body[:submit][:options] = { type: 'submit', value: }
    end
  end
end
