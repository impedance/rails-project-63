# frozen_string_literal: true

autoload :Textarea, "hexlet_code/textarea"
autoload :Input, "hexlet_code/input"
# This module provides methods for building HTML
class FormBuilder
  attr_accessor :url, :result, :resource, :method

  def initialize(resource, **options)
    @url = options[:url] || "#"
    @method = options[:method] || "post"
    options.delete(:url)
    url_attrs = { action: url, method: method }
    form_attrs = url_attrs.merge(options)
    @result = [Tag.build("form", form_attrs)]
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
