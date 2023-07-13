# frozen_string_literal: true

autoload :TextInput, 'hexlet_code/text_input'
autoload :StringInput, 'hexlet_code/string_input'
# This module provides methods for building HTML
class FormBuilder
  attr_accessor :resource, :form_body

  def initialize(resource, **options)
    @resource = resource
    action = options.fetch(:url, '#')
    @form_body = {
      inputs: [],
      submit: nil,
      form_options: { action:, method: 'post' }.merge(options.except(:url))
    }
  end

  def input(field_name, **attributes)
    resource.public_send(field_name)

    input_class = get_input_class(attributes[:as])
    @form_body[:inputs] << input_class.new(resource, field_name, attributes)
  end

  def get_input_class(as)
    as ||= :string
    "#{as.capitalize}Input".constantize
  end

  def submit(value = 'Save')
    @form_body[:submit] = { value: }
  end
end
