# frozen_string_literal: true

autoload :Textarea, "hexlet_code/textarea"
autoload :Input, "hexlet_code/input"
# This module provides methods for building HTML
class FormBuilder
  attr_accessor :url, :result, :resource

  def initialize(resource, **options)
    @url = options[:url] || "#"
    @result = [Tag.build("form", action: url, method: "post")]
    @resource = resource
  end

  def input(field_name, **attributes)
    resource.public_send(field_name)

    if attributes[:as] == :text
      textarea = Textarea.new(resource, field_name, attributes)
      @result << textarea.build
    else
      input = Input.new(resource, field_name, attributes)
      @result << input.build
    end
  end

  def submit(name = "Save")
    @result << Tag.build("input", type: "submit", value: name)
  end

  def close_form
    @result << "</form>"
  end
end
