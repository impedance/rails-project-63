# frozen_string_literal: true

autoload :BaseInput, "hexlet_code/base_input"

# Class for input tag
class Input < BaseInput
  attr_reader :attrs

  def initialize(resource, name, attrs)
    super(resource, name)
    @attrs = attrs
  end

  def build
    result = [Tag.build("label", for: name) { name.capitalize }]
    result << Tag.build("input", name: name, type: "text", value: resource[name], **attrs)
    result.join
  end
end
