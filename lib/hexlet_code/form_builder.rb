# frozen_string_literal: true

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
      @result << build_textarea(field_name, attributes)
    else
      build_input(field_name, attributes)
    end
  end

  def submit(name = "Save")
    @result << Tag.build("input", type: "submit", value: name)
  end

  def build_input(name, attributes)
    @result << Tag.build("label", for: name) { name.capitalize }
    @result << Tag.build("input", name: name, type: "text", value: resource[name],
                                  **attributes)
  end

  def build_textarea(name, attrs)
    cols = attrs[:cols] || 20
    rows = attrs[:rows] || 40
    Tag.build("textarea", name: name, cols: cols, rows: rows) { resource[name] }
  end

  def close_form
    @result << "</form>"
  end
end
